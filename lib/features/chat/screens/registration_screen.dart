import 'package:flutter/material.dart';
import 'package:flutter_practice/features/chat/utils/constants.dart';
import 'package:flutter_practice/features/chat/widgets/rounded_button.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = "registration_screen";

  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Hero(
                tag: 'logo',
                child: SizedBox(
                  height: 200,
                  child: Image.asset('assets/images/logo.png'),
                ),
              ),
              const SizedBox(
                height: 48,
              ),
              TextField(
                onChanged: (value) {},
                decoration: kInputDecoration.copyWith(
                  hintText: 'Enter your email',
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextField(
                onChanged: (value) {},
                decoration: kInputDecoration.copyWith(
                  hintText: 'Enter your password',
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              RoundedButton(
                color: Colors.blueAccent,
                text: 'Register',
                onPress: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
