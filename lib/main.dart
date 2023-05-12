import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jv_services/features/data/data_source/router/cubit/routing_cubit.dart';
import 'package:jv_services/features/data/data_source/router/router_provider.dart';

import 'package:jv_services/features/di/dep_injections.dart' as di;
import 'package:jv_services/features/presentation/splash/cubit/splash_cubit.dart';

import 'features/presentation/onBoarding/cubit/on_board_cubit.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.injectDeps();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final route = di.gi.call<GoRouterProvider>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => di.gi.call<OnBoardCubit>()..getOnBoardPages()),
        BlocProvider(create: (_) => di.gi.call<SplashCubit>()),
        BlocProvider(create: (_) => di.gi.call<RoutingCubit>())
      ],
      child: MaterialApp.router(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routerConfig: route.router,
      ),
    );
  }
}
