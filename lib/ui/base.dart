import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../services/states.dart';
import 'app.dart';

class Base<B extends StateStreamable<S>, S> extends BlocBuilderBase<B, S> {
  const Base({
    Key? key,
    required this.child,
  }) : super(key: key);

  final BlocWidgetBuilder<S> child;

  @override
  Widget build(BuildContext context, S state) {
    if (state == States.Loading) {
      return App(
        child: Stack(
          children: [
            child(context, state),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
              child: Container(
                width: double.maxFinite,
                height: double.maxFinite,
                color: Colors.grey.withOpacity(0.5),
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
          ],
        ),
      );
    } else if (state == States.Error) {
      return const App(
        child: Center(
          child: Text('An error happend during the process'),
        ),
      );
    } else {
      return App(
        child: child(context, state),
      );
    }
  }
}
