import 'package:flutter/material.dart';
import 'package:flutter_practice/features/nav/nav_screen3.dart';

class NavScreen2 extends StatelessWidget {
  const NavScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Screen 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.blue),
              ),
              child: const Text('Go Fowards To Screen1'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const NavScreen3()),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.blue.shade300),
              ),
              child: const Text('Go Fowards To Screen3'),
            ),
          ],
        ),
      ),
    );
  }
}
