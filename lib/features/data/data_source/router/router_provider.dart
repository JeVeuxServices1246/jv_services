import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jv_services/features/data/data_source/router/cubit/routing_cubit.dart';
import 'package:jv_services/features/data/data_source/router/router_listener.dart';
import 'package:jv_services/features/domain/repository/shared_pref/shared_pref_repo.dart';
import 'package:jv_services/features/presentation/dashboard/ui/dashboard_screen.dart';
import 'package:jv_services/features/presentation/login/ui/login_screen.dart';
import 'package:jv_services/features/presentation/onBoarding/ui/on_boarding_screen.dart';
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

  late final GoRouter router = GoRouter(
      // debugLogDiagnostics: true,
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
            path: AppRouteConstants.loginRouteInfo.path,
            name: AppRouteConstants.loginRouteInfo.name,
            pageBuilder: (context, state) {
              return const MaterialPage(child: LoginScreen());
            }),
        GoRoute(
            path: AppRouteConstants.welcomeRouteInfo.path,
            name: AppRouteConstants.welcomeRouteInfo.name,
            pageBuilder: (context, state) {
              return const MaterialPage(child: WelcomeScreen());
            })
      ],
      redirect: (context, state) {
        final RoutingState newState = routingCubit.state;
        print(newState.toString());
        if (newState is RoutingSplash) {
          return AppRouteConstants.splashRouteInfo.path;
        }
        if (newState is RoutingOnBoard) {
          return AppRouteConstants.onBoardingRouteInfo.path;
        }
        if (newState is RoutingWelcome) {
          return AppRouteConstants.welcomeRouteInfo.path;
        }
        if (newState is RoutingLogin) {
          return AppRouteConstants.loginRouteInfo.path;
        }
        if (newState is RoutingDashboard) {
          return AppRouteConstants.dashboardRouteInfo.path;
        }
        return null;
      },
      refreshListenable: routingListner);

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
}





        
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