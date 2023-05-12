import 'dart:async';

import 'package:flutter/material.dart';

class RouterRefreshStream extends ChangeNotifier {
  RouterRefreshStream(Stream<dynamic> stream) {
    print("listening");
    notifyListeners();
    _streamSubscription = stream.asBroadcastStream().listen((dynamic _) {
      print("listening");
      notifyListeners();
    });
  }
  late final StreamSubscription<dynamic> _streamSubscription;

  @override
  void dispose() {
    _streamSubscription.cancel();
    super.dispose();
  }
}
