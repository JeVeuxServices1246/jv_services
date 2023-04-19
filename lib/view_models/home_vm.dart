
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../push/platform_specific/android.dart';
import 'base_vm.dart';

class HomeVM extends BaseViewModel{
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;
  final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  openDrawerFromController() {
    scaffoldKey.currentState!.openDrawer();
  }

  int _currentIndex = 0;


  @override
  initView() {
    firebaseMessaging.requestPermission( alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,);
    initializeFlutterLocalNotifications().then((value){
      flutterLocalNotificationsPlugin = value;
      configureFirebase(firebaseMessaging);
      FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    });
    return super.initView();
  }

  @pragma('vm:entry-point')
  Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    // If you're going to use other Firebase services in the background, such as Firestore,
    // make sure you call `initializeApp` before using other Firebase services.
    if (message.notification != null) {
      displayForegroundNotification(message.notification!);
    }
    print("Handling a background message: ${message.messageId}");
  }
  void configureFirebase(FirebaseMessaging firebaseMessaging) {
    try {
      FirebaseMessaging.onMessage.listen((message) {
        if (message.notification != null) {
          displayForegroundNotification(message.notification!);
        }

      },);
      FirebaseMessaging.onMessageOpenedApp.listen((event) {
        // Map body = jsonDecode(event.notification!.body??"");
        // MyOrderVM myOrderVM = context.read<MyOrderVM>();
        // OrderModel orderModel = OrderModel();
        // orderModel.id = body['order_id'];
        // myOrderVM.selectedOrder = orderModel;
        // context.push(const MyOrdersDetail());
      },);
    } catch (e) {
      print(e.toString());
    }
  }
  void displayForegroundNotification(RemoteNotification notification) async {
    var androidOptions = AndroidNotificationDetails(debugChannel.id, debugChannel.name,
        channelDescription: debugChannel.description,
        importance: Importance.max,
        priority: Priority.high,
        ticker: "A manually-sent push notification.",
        styleInformation: const DefaultStyleInformation(
          false,
          false,
        ));
    const iosOptions = DarwinNotificationDetails(
        presentAlert: true, presentBadge: true, presentSound: true);
    var platformChannelSpecifics =
    NotificationDetails(android: androidOptions, iOS: iosOptions);
    await flutterLocalNotificationsPlugin!.show(
        0, notification.title, "", platformChannelSpecifics);
  }

  Future<FlutterLocalNotificationsPlugin>
  initializeFlutterLocalNotifications() async {
    final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
// initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
    // 'mipmap/ic_launcher' taken from https://github.com/MaikuB/flutter_local_notifications/issues/32#issuecomment-389542800
    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('mipmap/ic_launcher');
    DarwinInitializationSettings initializationSettingsIOS =
    const DarwinInitializationSettings();
    final InitializationSettings initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
    return flutterLocalNotificationsPlugin;
  }

  int get currentIndex => _currentIndex;

  set currentIndex(int value) {
    _currentIndex = value;
    FocusManager.instance.primaryFocus!.unfocus();
    notifyListeners();
  }

  removeFocus() {
    FocusManager.instance.primaryFocus!.unfocus();
  }


}