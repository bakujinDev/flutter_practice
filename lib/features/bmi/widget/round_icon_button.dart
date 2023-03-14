import 'package:flutter/material.dart';
import 'package:flutter_practice/features/bmi/data/constants.dart';

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({
    super.key,
    required this.icon,
    this.onPress,
  });

  final IconData icon;
  final Function? onPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: const CircleBorder(),
      constraints: const BoxConstraints(
        minWidth: 56,
        minHeight: 56,
      ),
      fillColor: kGray2,
      elevation: 6,
      onPressed: onPress != null
          ? () {
              onPress!();
            }
          : null,
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}
