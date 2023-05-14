import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void dispose() {
    print("dispose welcom");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                context.go("/welcome/login");
              },
              child: const Text("Goto login")),
          const SizedBox(
            height: 10.0,
          ),
          ElevatedButton(
              onPressed: () {
                context.go("/welcome/register");
              },
              child: const Text("registration")),
        ],
      ),
    );
  }
}
