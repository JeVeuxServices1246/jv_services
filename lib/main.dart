
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jv_services/constant/color.dart';
import 'package:jv_services/constant/dimension.dart';
import 'package:jv_services/screens/splash.dart';
import 'package:jv_services/utils/hive_utils.dart';
import 'package:jv_services/view_models/account_user_tab_vm.dart';
import 'package:jv_services/view_models/edit_profile_user_vm.dart';
import 'package:jv_services/view_models/home_vm.dart';
import 'package:jv_services/view_models/homeservice_tab_vm.dart';
import 'package:jv_services/view_models/jeveux_screen_tab_vm.dart';
import 'package:jv_services/view_models/login_vm.dart';
import 'package:jv_services/view_models/mobile_number_vm.dart';
import 'package:jv_services/view_models/new_password_vm.dart';
import 'package:jv_services/view_models/notification_screen_vm.dart';
import 'package:jv_services/view_models/onboarding_vm.dart';
import 'package:jv_services/view_models/personal_user_tab_vm.dart';
import 'package:jv_services/view_models/signup_vm.dart';
import 'package:jv_services/view_models/splash_vm.dart';
import 'package:jv_services/view_models/storescreen_user_tab_vm.dart';
import 'package:jv_services/view_models/verification_vm.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await HiveUtils.init();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(
    MultiProvider(
      providers:[
        ChangeNotifierProvider(create: (context) => SplashVM()),
        ChangeNotifierProvider(create: (context) => OnboardingVM()),
        ChangeNotifierProvider(create: (context) => LoginVM()),
        ChangeNotifierProvider(create: (context) => HomeVM()),
        ChangeNotifierProvider(create: (context) => SignUpVM()),
        ChangeNotifierProvider(create: (context) => MobileNumberScreenVM()),
        ChangeNotifierProvider(create: (context) => VerificationVM()),
        ChangeNotifierProvider(create: (context) => NewPasswordVM()),
        ChangeNotifierProvider(create: (context) => JEveuxScreenVM()),
        ChangeNotifierProvider(create: (context) => PersonalUserVM()),
        ChangeNotifierProvider(create: (context) => HomeServiceVM()),
        ChangeNotifierProvider(create: (context) => StoreScreenUserVM()),
        ChangeNotifierProvider(create: (context) => AccountUserVM()),
        ChangeNotifierProvider(create: (context) => NotificationScreenVM()),
        ChangeNotifierProvider(create: (context) => EditProfileUserVM()),
      ],
      child: const MyApp(),
    ),
  );
}
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  print("Handling a background message: ${message.messageId}");
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widgets is the root of your application.
  @override
  Widget build(BuildContext context) {
    Map<int, Color> color = const {
      50: Color.fromRGBO(4, 131, 184, .1),
      100: Color.fromRGBO(4, 131, 184, .2),
      200: Color.fromRGBO(4, 131, 184, .3),
      300: Color.fromRGBO(4, 131, 184, .4),
      400: Color.fromRGBO(4, 131, 184, .5),
      500: Color.fromRGBO(4, 131, 184, .6),
      600: Color.fromRGBO(4, 131, 184, .7),
      700: Color.fromRGBO(4, 131, 184, .8),
      800: Color.fromRGBO(4, 131, 184, .9),
      900: Color.fromRGBO(4, 131, 184, 1),
    };
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return ScreenUtilInit(
            designSize: Size(constraints.maxWidth, constraints.maxHeight),
            builder: (context2 , child) => MaterialApp(
              title: 'Jv Services',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                textTheme: GoogleFonts.poppinsTextTheme(
                  Theme.of(context).textTheme,
                ),
                primarySwatch: primaryColorShades, fontFamily: "Roboto",
              ),
              home: const SplashWidget(),
            ),
          );
        });
  }
}
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
