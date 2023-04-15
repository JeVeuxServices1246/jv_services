import 'package:jv_services/utils/extensions/goto.dart';

import '../screens/onboarding_screen.dart';
import '../utils/hive_utils.dart';
import '../utils/session_key.dart';
import 'base_vm.dart';

class SplashVM extends BaseViewModel{
  void checkIsLogin() async {
    Future.delayed(const Duration(seconds: 2),
            () {
              context.pushReplacement(const Onboarding());
              // if(HiveUtils.getSession<bool>(SessionKey.isLoggedIn,defaultValue: false)){
              //   Get.offAllNamed(MyRouter.homeScreen);
              // }else{
              //   Get.offAllNamed(MyRouter.onBoardingScreen);
              // }
        });
  }
  @override
  initView() {
    checkIsLogin();
    return super.initView();
  }


}