import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jv_services/features/data/data_source/router/cubit/routing_cubit.dart';

class RoutingListner extends ChangeNotifier {
  late final StreamSubscription<RoutingState> _streamSubscription;
  RoutingListner(RoutingCubit routingCubit) {
    notifyListeners();
    _streamSubscription =
        routingCubit.stream.asBroadcastStream().listen((event) {
      print("listin");
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _streamSubscription.cancel();
    super.dispose();
  }
}
