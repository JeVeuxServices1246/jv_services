
import 'package:flutter/material.dart';
import 'package:jv_services/utils/theme_extension.dart';

import '../constant/app_assets_path.dart';
import '../constant/dimension.dart';
import '../view_models/splash_vm.dart';
import '../widget/base_widget.dart';

class SplashWidget extends BaseWidget<SplashVM>{
  const SplashWidget({super.key});

  @override
  Widget buildUI(BuildContext context, SplashVM viewModel) {
    var deviceWidth = MediaQuery.of(context).size.width;
    var deviceHeight = MediaQuery.of(context).size.height;
    AddSize.init(context);
    return Scaffold(
      backgroundColor: context.theme.primary,
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
          Positioned(
              top: 30,
              bottom: 30,
              right: 60,
              left: 60,
              child: Image.asset(
                AppAssets.splashLogo,
                height: 300,
                width: 300,
              ))
        ],
      ),
    );
  }

}
