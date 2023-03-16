import 'package:flutter/material.dart';
import 'package:flutter_practice/features/chat/screens/chat_screen.dart';
import 'package:flutter_practice/features/chat/screens/login_screen.dart';
import 'package:flutter_practice/features/chat/screens/registration_screen.dart';
import 'package:flutter_practice/features/chat/screens/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xff0a0e21),
        scaffoldBackgroundColor: const Color(0xff0a0e21),
        appBarTheme: AppBarTheme.of(context).copyWith(
          backgroundColor: const Color(0xff0a0e21),
        ),
        // textTheme: const TextTheme(
        //   bodyMedium: TextStyle(
        //     color: Colors.black54,
        //   ),
        // ),
      ),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => const WelcomeScreen(),
        ChatLoginScreen.id: (context) => const ChatLoginScreen(),
        RegistrationScreen.id: (context) => const RegistrationScreen(),
        ChatScreen.id: (context) => const ChatScreen(),
      },
    );
  }
}
