import 'package:flutter/material.dart';

class RegisterOTPScreen extends StatefulWidget {
  const RegisterOTPScreen({super.key});

  @override
  State<RegisterOTPScreen> createState() => _RegisterOTPScreenState();
}

class _RegisterOTPScreenState extends State<RegisterOTPScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Enter OTP"),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("register OTP"),
          ],
        ),
      ),
    );
  }
}
