import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jv_services/features/data/data_source/router/cubit/routing_cubit.dart';

class RoutingListner extends ChangeNotifier {
  late final StreamSubscription<RoutingState> _streamSubscription;
  RoutingListner(RoutingCubit routingCubit) {
    print(routingCubit.state.toString());
    notifyListeners();
    listening(routingCubit);
  }

  void listening(RoutingCubit routingCubit) async {
    await Future.delayed(const Duration(seconds: 5));
    _streamSubscription =
        routingCubit.stream.asBroadcastStream().listen((event) {
      notifyListeners();
    });
    print("object");
    notifyListeners();
  }

  @override
  void dispose() {
    _streamSubscription.cancel();
    super.dispose();
  }
}
