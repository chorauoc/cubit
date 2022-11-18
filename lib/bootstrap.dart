import 'package:get_it/get_it.dart';
import 'package:price_tracker/services/api.dart';
import 'package:price_tracker/ui/home/cubit/home_cubit.dart';
import 'package:price_tracker/ui/home/repository/home_repository.dart';

final getIt = GetIt.instance;
void lazy() {
  getIt.registerSingleton<Api>(Api());
  getIt.registerSingleton<HomeRepository>(
    HomeRepository(
      api: getIt.get<Api>(),
    ),
  );
  getIt.registerSingleton<HomeCubit>(
    HomeCubit(
      repository: getIt.get<HomeRepository>(),
    ),
  );
}
