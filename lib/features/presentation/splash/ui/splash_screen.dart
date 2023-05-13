import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jv_services/core/constants/app_assets.dart';
import 'package:jv_services/features/data/data_source/router/cubit/routing_cubit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    print("splac");
    goto(context);
  }

  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;
    var deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        // backgroundColor: context.theme.primary,
        body: Stack(
      children: [
        Row(
          children: [
            Flexible(
              child: SizedBox(
                  width: deviceWidth * 1,
                  height: deviceHeight * 1,
                  child: Image.asset(
                    AppAssets.splashWhiteBackground,
                    fit: BoxFit.fill,
                  )),
            ),
            Flexible(
              child: SizedBox(
                  width: deviceWidth * 1,
                  height: deviceHeight * 1,
                  child: Image.asset(
                    AppAssets.splashBlackBackground,
                    fit: BoxFit.fill,
                  )),
            )
          ],
        ),
        Center(
          child: Image.asset(
            AppAssets.splashLogo,
            height: deviceHeight / 2,
            width: deviceWidth / 1.5,
          ),
        ),
      ],
    ));
  }

  void goto(BuildContext context) async {
    final cub = context.read<RoutingCubit>();
    await Future.delayed(const Duration(seconds: 1));
    print("goto");
    cub.gotoNext();
  }
}


    // return BlocListener<SplashCubit, SplashState>(
    //   listener: (childContext, state) {
    //     if (state is SplashGoOnBoarding) {
    //       // goto route
    //     }
    //   },
    //   builder: (childContext, state) {
    //     if (state is SplashInitial) {
    //       goto(childContext);
    //     }

    //   },
    // );