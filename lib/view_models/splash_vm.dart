import 'package:jv_services/screens/home_screen.dart';
import 'package:jv_services/utils/extensions/goto.dart';

import '../constant/dimension.dart';
import '../screens/onboarding_screen.dart';
import '../utils/hive_utils.dart';
import '../utils/session_key.dart';
import 'base_vm.dart';

class SplashVM extends BaseViewModel{
  void checkIsLogin() async {
    Future.delayed(const Duration(seconds: 2),
            () {
              if(HiveUtils.getSession<bool>(SessionKey.isLoggedIn,defaultValue: false)){
                context.pushAndRemoveUntil(const HomeScreen());
              }else{
                context.pushAndRemoveUntil(const Onboarding());
              }
        });
  }
  @override
  initView() {
    checkIsLogin();
    return super.initView();
  }


}