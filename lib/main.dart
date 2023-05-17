import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jv_services/features/data/data_source/router/cubit/routing_cubit.dart';
import 'package:jv_services/features/data/data_source/router/router_provider.dart';
import 'package:jv_services/features/presentation/common/countries/bloc/countries_list_bloc.dart';
import 'package:jv_services/features/presentation/register/bloc/register_bloc.dart';
import 'package:jv_services/features/presentation/splash/cubit/splash_cubit.dart';
import 'features/presentation/onBoarding/cubit/on_board_cubit.dart';
import 'package:jv_services/features/di/dep_injections.dart' as di;

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.injectDeps();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => di.gi.call<OnBoardCubit>()..getOnBoardPages()),
        BlocProvider(create: (_) => di.gi.call<SplashCubit>()),
        BlocProvider(create: (_) => di.gi.call<RoutingCubit>()),
        BlocProvider(create: (_) => di.gi.call<RegisterBloc>()),
        BlocProvider(create: (_) => di.gi.call<CountriesListBloc>()),
      ],
      child: MaterialApp.router(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routerConfig: di.gi.call<GoRouterProvider>().router,
      ),
    );
  }
}
