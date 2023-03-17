import 'package:flutter/material.dart';
import 'package:flutter_practice/features/chat/screens/chat_screen.dart';
import 'package:flutter_practice/features/chat/utils/constants.dart';
import 'package:flutter_practice/features/chat/widgets/rounded_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = "registration_screen";

  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  String email = '';
  String password = '';
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: SafeArea(
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
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: kInputDecoration.copyWith(
                    hintText: 'Enter your email',
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  obscureText: true,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    password = value;
                  },
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
                  onPress: () async {
                    showSpinner = true;
                    setState(() {});

                    try {
                      final newUser =
                          await _auth.createUserWithEmailAndPassword(
                        email: email,
                        password: password,
                      );

                      if (!mounted) return;

                      Navigator.pushNamed(context, ChatScreen.id);

                      showSpinner = false;
                      setState(() {});
                    } catch (e) {
                      print(e);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
