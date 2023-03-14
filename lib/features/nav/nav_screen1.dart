import 'package:flutter/material.dart';

class NavScreen1 extends StatelessWidget {
  const NavScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Screen 1'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => const NavScreen2()),
            // );
            Navigator.pushNamed(context, '/first');
          },
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.red),
          ),
          child: const Text('Go Fowards To Screen2'),
        ),
      ),
    );
  }
}
