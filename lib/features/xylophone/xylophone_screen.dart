import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class XylophoneScreen extends StatelessWidget {
  const XylophoneScreen({super.key});

  void playSound(int index) async {
    final player = AudioPlayer();

    await player.play(AssetSource('sounds/assets_note${index + 1}.wav'));
  }

  @override
  Widget build(BuildContext context) {
    final List<Color> rainbow = [
      Colors.red,
      Colors.orange,
      Colors.yellow,
      Colors.green,
      Colors.teal,
      Colors.blue,
      Colors.purple,
    ];

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            for (int i = 0; i < rainbow.length; i++)
              Flexible(
                flex: 1,
                child: GestureDetector(
                  onTap: () => playSound(i),
                  child: Container(
                    color: rainbow[i],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
