import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final Color? color;
  final Function? onPress;
  final String? text;

  const RoundedButton({
    super.key,
    this.color,
    this.onPress,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
      ),
      child: Material(
        elevation: 5,
        color: color,
        borderRadius: BorderRadius.circular(30),
        child: MaterialButton(
          onPressed: () {
            if (onPress == null) return;
            onPress!();
          },
          minWidth: 200,
          height: 42,
          child: Text(
            text ?? '',
          ),
        ),
      ),
    );
  }
}
