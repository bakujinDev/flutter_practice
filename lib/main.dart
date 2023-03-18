import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice/features/provider/level1.dart';
import 'package:flutter_practice/features/todoey/screens/task_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDefault();
  runApp(const MyApp());
}

Future<void> initializeDefault() async {
  FirebaseApp app = await Firebase.initializeApp();
  print('Initialized default app $app');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Counter()),
      ],
      child: const MaterialApp(
        title: 'Flutter Demo',
        // theme: ThemeData.dark().copyWith(
        //   primaryColor: const Color(0xff0a0e21),
        //   scaffoldBackgroundColor: const Color(0xff0a0e21),
        //   appBarTheme: AppBarTheme.of(context).copyWith(
        //     backgroundColor: const Color(0xff0a0e21),
        //   ),
        //   textTheme: const TextTheme(
        //     titleMedium: TextStyle(
        //       color: Colors.black,
        //     ),
        //     bodyLarge: TextStyle(
        //       color: Colors.black,
        //     ),
        //     bodyMedium: TextStyle(
        //       color: Colors.black,
        //     ),
        //     bodySmall: TextStyle(
        //       color: Colors.black,
        //     ),
        //   ),
        // ),
        home: Level1(),
      ),
    );
  }
}

class Counter extends ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}
