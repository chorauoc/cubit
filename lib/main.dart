import 'package:flutter/material.dart';
import 'package:price_tracker/routes/router.dart';
import 'package:price_tracker/ui/home/cubit/home_cubit.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bootstrap.dart';

void main() {
  lazy();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider.value(value: getIt.get<HomeCubit>()),
      ],
      child: ResponsiveSizer(
        builder: (context, orientation, deviceType) {
          return const MyApp();
        },
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: getIt.get<RouteGenerator>().routerConfig,
    );
  }
}
