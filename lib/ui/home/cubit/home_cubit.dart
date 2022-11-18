import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/post.dart';
import '../../../services/states.dart';
import '../repository/home_repository.dart';

class HomeCubit extends Cubit<States> {
  final HomeRepository repository;
  HomeCubit({required this.repository}) : super(States.Initial);

  List<Post> posts = [];

  void getPostsList() {
    repository.getPostsList(
      onInit: onInitCallback,
      onSuccess: onSuccessCallback,
      onError: onErrorCallback,
    );
  }

  void onInitCallback() {
    emit(States.Loading);
  }

  void onSuccessCallback(List<Post> rs) {
    posts.addAll(rs);
    emit(States.Complete);
  }

  void onErrorCallback(dynamic error) {
    emit(States.Error);
  }
}
