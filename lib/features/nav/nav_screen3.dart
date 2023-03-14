import 'package:flutter/material.dart';

class NavScreen3 extends StatelessWidget {
  const NavScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Screen 3'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => const NavScreen1()),
            // );
            Navigator.pushNamed(context, '/');
          },
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.red),
          ),
          child: const Text('Go Fowards To Screen1'),
        ),
      ),
    );
  }
}
