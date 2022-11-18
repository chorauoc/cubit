
import 'package:price_tracker/services/endpoints.dart';

import '../../../models/post.dart';
import '../../../services/api.dart';

class HomeRepository {
  final Api api;
  HomeRepository({required this.api});

  Future<void> getPostsList({
    required Function() onInit,
    required Function(List<Post> posts) onSuccess,
    required Function(dynamic error) onError,
  }) async {
    await api.requestGet(
      url: Posts,
      data: null,
      onInit: onInit,
      onSuccess: (data) {
        onSuccess(
            (data as List).map((postJson) => Post.fromJson(postJson)).toList());
      },
      onError: onError,
    );
  }
}
