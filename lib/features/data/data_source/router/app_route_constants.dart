import 'package:jv_services/features/data/models/common/route_info.dart';

class AppRouteConstants {
  static const RouteInfo dashboardRouteInfo =
      RouteInfo('Dashboard', '/', true, '/');
  static const RouteInfo splashRouteInfo =
      RouteInfo('Splash', '/splash', false, '/splash');
  static const RouteInfo onBoardingRouteInfo =
      RouteInfo('On Boarding', '/on_boarding', false, '/on_boarding');
  static const RouteInfo welcomeRouteInfo =
      RouteInfo('Welcome', '/welcome', false, '/welcome');
  static const RouteInfo demoRouteInfo =
      RouteInfo('Demo', '/demo', true, '/demo');
  static const RouteInfo loginRouteInfo =
      RouteInfo('Login', 'login', false, '/welcome/login');
  static const RouteInfo loginOTPRouteInfo =
      RouteInfo('OTP Sent', 'otp', false, '/welcome/login/otp');
  static const RouteInfo registerRouteInfo =
      RouteInfo('Register', 'register', false, '/welcome/register');
  static const RouteInfo registerOTPRouteInfo =
      RouteInfo('OTP Sent', 'otp', false, '/welcome/register/otp');
}
