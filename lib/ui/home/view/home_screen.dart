import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/post.dart';
import '../../../services/states.dart';
import '../../app.dart';
import '../../base.dart';
import '../cubit/home_cubit.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var posts;


  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getPostsList();
  }

  @override
  Widget build(BuildContext context) {
    return Base<HomeCubit, States>(
        child: (context, state) {
          posts = context.select((HomeCubit c) => c.posts);
          return RefreshIndicator(
            onRefresh: ()async{
              context.read<HomeCubit>().getPostsList();
            },
            child: ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                Post item = posts.elementAt(index);
                return Text(item.title);
              },
            ),
          );
        });
  }
}
