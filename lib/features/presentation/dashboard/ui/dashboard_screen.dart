import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jv_services/features/data/data_source/router/cubit/routing_cubit.dart';

class DashboadScreen extends StatefulWidget {
  const DashboadScreen({super.key});

  @override
  State<DashboadScreen> createState() => _DashboadScreenState();
}

class _DashboadScreenState extends State<DashboadScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
              onPressed: () {
                context.read<RoutingCubit>().logout();
              },
              child: const Text("logout"))),
    );
  }
}
