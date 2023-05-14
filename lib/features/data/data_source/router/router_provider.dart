import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jv_services/features/data/data_source/router/cubit/routing_cubit.dart';
import 'package:jv_services/features/data/data_source/router/router_listener.dart';
import 'package:jv_services/features/domain/repository/shared_pref/shared_pref_repo.dart';
import 'package:jv_services/features/presentation/dashboard/ui/dashboard_screen.dart';
import 'package:jv_services/features/presentation/demo_screen.dart';
import 'package:jv_services/features/presentation/login/ui/login_screen.dart';
import 'package:jv_services/features/presentation/onBoarding/ui/on_boarding_screen.dart';
import 'package:jv_services/features/presentation/register/ui/register_screen.dart';
import 'package:jv_services/features/presentation/splash/ui/splash_screen.dart';
import 'package:jv_services/features/presentation/welcome/ui/welcome_screen.dart';

import 'app_route_constants.dart';

class GoRouterProvider {
  final SharedPrefRepo prefRepo;

  final RoutingCubit routingCubit;

  final RoutingListner routingListner;

  GoRouterProvider({
    required this.routingCubit,
    required this.routingListner,
    required this.prefRepo,
  });

  GoRouter get router => _router;

  late final GoRouter _router = GoRouter(
      debugLogDiagnostics: true,
      routes: [
        GoRoute(
            path: AppRouteConstants.dashboardRouteInfo.path,
            name: AppRouteConstants.dashboardRouteInfo.name,
            pageBuilder: (context, state) {
              return const MaterialPage(child: DashboadScreen());
            }),
        GoRoute(
            path: AppRouteConstants.splashRouteInfo.path,
            name: AppRouteConstants.splashRouteInfo.name,
            pageBuilder: (context, state) {
              return const MaterialPage(child: SplashScreen());
            }),
        GoRoute(
            path: AppRouteConstants.onBoardingRouteInfo.path,
            name: AppRouteConstants.onBoardingRouteInfo.name,
            pageBuilder: (context, state) {
              return const MaterialPage(child: OnBoardingScreen());
            }),
        GoRoute(
            path: AppRouteConstants.welcomeRouteInfo.path,
            name: AppRouteConstants.welcomeRouteInfo.name,
            builder: (context, state) {
              return const WelcomeScreen();
            },
            routes: [
              GoRoute(
                  path: AppRouteConstants.loginRouteInfo.path,
                  name: AppRouteConstants.loginRouteInfo.name,
                  pageBuilder: (context, state) {
                    return const MaterialPage(child: LoginScreen());
                  }),
              GoRoute(
                  path: AppRouteConstants.registerRouteInfo.path,
                  name: AppRouteConstants.registerRouteInfo.name,
                  builder: (context, state) {
                    return const RegisterScreen();
                  }),
            ]),
        GoRoute(
            path: AppRouteConstants.demoRouteInfo.path,
            name: AppRouteConstants.demoRouteInfo.name,
            pageBuilder: (context, state) {
              return const MaterialPage(child: DemoScreen());
            }),
      ],
      redirect: (context, GoRouterState state) {
        final RoutingState routingState = routingCubit.state;
        print(state.location);

        final loggedIn = routingState is RoutingDashboard;
        final welcome = routingState is RoutingWelcome;
        final isSplash = routingState is RoutingSplash;
        final isOnBoard = routingState is RoutingOnBoard;
        final isLoginPath =
            state.location == AppRouteConstants.loginRouteInfo.fullPath;
        // "${AppRouteConstants.welcomeRouteInfo.path}/${AppRouteConstants.loginRouteInfo.path}";
        final isSplashPath =
            state.location == AppRouteConstants.splashRouteInfo.path;
        final isOnBoardPath =
            state.location == AppRouteConstants.onBoardingRouteInfo.path;
        final isDashboardPath =
            state.location == AppRouteConstants.dashboardRouteInfo.path;
        final isRegisterPath =
            state.location == AppRouteConstants.registerRouteInfo.fullPath;
        // "${AppRouteConstants.welcomeRouteInfo.path}/${AppRouteConstants.registerRouteInfo.path}";

        if (isSplash) {
          return AppRouteConstants.splashRouteInfo.path;
        }
        if (isOnBoard) {
          return AppRouteConstants.onBoardingRouteInfo.path;
        }
        if (welcome) {
          if (isRegisterPath || isLoginPath) {
            return null;
          }
          return AppRouteConstants.welcomeRouteInfo.path;
        }
        if (loggedIn) {
          if (isSplashPath || isLoginPath) {
            return AppRouteConstants.dashboardRouteInfo.path;
          }
        }
        return null;
      },
      refreshListenable: routingListner);
}

  // if (isLogging) {
  //   return AppRouteConstants.dashboardRouteInfo.path;
  // }
  // if (routingState is RoutingLogin) {
  //   return AppRouteConstants.loginRouteInfo.path;
  // }
  // GoRouter goRouter() {
  //   return GoRouter(
  //       routes: [
  //         GoRoute(
  //             path: AppRouteConstants.dashboardRouteInfo.path,
  //             name: AppRouteConstants.dashboardRouteInfo.name,
  //             pageBuilder: (context, state) {
  //               return const MaterialPage(child: DashboadScreen());
  //             }),
  //         GoRoute(
  //             path: AppRouteConstants.splashRouteInfo.path,
  //             name: AppRouteConstants.splashRouteInfo.name,
  //             pageBuilder: (context, state) {
  //               return const MaterialPage(child: SplashScreen());
  //             }),
  //         GoRoute(
  //             path: AppRouteConstants.onBoardingRouteInfo.path,
  //             name: AppRouteConstants.onBoardingRouteInfo.name,
  //             pageBuilder: (context, state) {
  //               return const MaterialPage(child: OnBoardingScreen());
  //             }),
  //         GoRoute(
  //             path: AppRouteConstants.loginRouteInfo.path,
  //             name: AppRouteConstants.loginRouteInfo.name,
  //             pageBuilder: (context, state) {
  //               return const MaterialPage(child: LoginScreen());
  //             }),
  //         GoRoute(
  //             path: AppRouteConstants.welcomeRouteInfo.path,
  //             name: AppRouteConstants.welcomeRouteInfo.name,
  //             pageBuilder: (context, state) {
  //               return const MaterialPage(child: WelcomeScreen());
  //             })
  //       ],
  //       redirect: (context, state) {
  //         final RoutingState newState = routingCubit.state;
  //         print(newState.toString());
  //         if (newState is RoutingSplash) {
  //           return AppRouteConstants.splashRouteInfo.path;
  //         }
  //         if (newState is RoutingOnBoard) {
  //           return AppRouteConstants.onBoardingRouteInfo.path;
  //         }
  //         if (newState is RoutingWelcome) {
  //           return AppRouteConstants.welcomeRouteInfo.path;
  //         }
  //         if (newState is RoutingLogin) {
  //           return AppRouteConstants.loginRouteInfo.path;
  //         }
  //         if (newState is RoutingDashboard) {
  //           return AppRouteConstants.dashboardRouteInfo.path;
  //         }
  //         return null;
  //       },
  //       refreshListenable: RouterRefreshStream(stream: routingCubit.stream));
  // }





        
        // GoRoute(
        //   path: '/login',
        //   name: "Second Page",
        //   builder: (context, state) => BlocProvider(
        //     create: (context) => OnBoardingController(),
        //     child: BlocBuilder<OnBoardingController, OnBoardingState>(
        //         builder: (context, state) {
        //       return const SecondPage();
        //     }),
        //   ),
        // ),