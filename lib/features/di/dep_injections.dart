import 'package:get_it/get_it.dart';
import 'package:jv_services/features/data/data_source/onBoardPageDs/on_boarding_page_ds.dart';
import 'package:jv_services/features/data/data_source/onBoardPageDs/on_boarding_page_ds_impl.dart';
import 'package:jv_services/features/data/data_source/router/cubit/routing_cubit.dart';
import 'package:jv_services/features/data/data_source/router/router_listener.dart';
import 'package:jv_services/features/data/data_source/router/router_provider.dart';
import 'package:jv_services/features/data/data_source/sharedPrefs/shared_prefs_ds.dart';
import 'package:jv_services/features/data/data_source/sharedPrefs/shared_prefs_ds_impl.dart';
import 'package:jv_services/features/data/repository/on_boarding_page/on_boarding_page_repo_impl.dart';
import 'package:jv_services/features/data/repository/shared_pref/shared_pref_repo_impl.dart';
import 'package:jv_services/features/domain/repository/on_boarding_page/on_boarding_page_repo.dart';
import 'package:jv_services/features/domain/repository/shared_pref/shared_pref_repo.dart';
import 'package:jv_services/features/presentation/onBoarding/cubit/on_board_cubit.dart';
import 'package:jv_services/features/presentation/splash/cubit/splash_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

final gi = GetIt.instance;

Future<void> injectDeps() async {
  gi.registerFactory(() => RoutingListner(gi.call()));

  // cubit`
  gi.registerFactory(() => OnBoardCubit(onBoardingPageRepo: gi.call()));
  gi.registerFactory(() => SplashCubit());
  gi.registerLazySingleton(() => RoutingCubit(sharedPrefRepo: gi.call()));

  // repository
  gi.registerFactory<OnBoardingPageRepo>(
      () => OnBoardingPageRepoImpl(onBoardingPageDS: gi.call()));
  gi.registerLazySingleton<SharedPrefRepo>(
      () => SharedPrefRepoImpl(sharedPrefsDS: gi.call()));

  // datasource
  gi.registerFactory<OnBoardingPageDS>(() => OnBoardingPageDSImpl());

  gi.registerLazySingleton<SharedPrefsDS>(
      () => SharedPrefsDSImpl(preferences: gi.call()));

  // router
  gi.registerLazySingleton(() => GoRouterProvider(
      prefRepo: gi.call(), routingCubit: gi.call(), routingListner: gi.call()));

  // External
  final sharedPrefExteranl = await SharedPreferences.getInstance();
  gi.registerLazySingleton(() => sharedPrefExteranl);
}
