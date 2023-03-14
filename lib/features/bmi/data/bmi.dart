import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender {
  male,
  female,
}

enum Category {
  male,
  female,
  height,
  weight,
  age,
}

class Bmi {
  Gender? gender;
  int height;
  int weight;
  int age;

  Bmi({
    this.gender,
    this.height = 180,
    this.weight = 60,
    this.age = 20,
  });

  IconData getIcon(Category category) {
    switch (category) {
      case Category.male:
        return FontAwesomeIcons.mars;
      case Category.female:
        return FontAwesomeIcons.venus;
      default:
        return Icons.error;
    }
  }

  String getLabel(Category category) {
    switch (category) {
      case Category.male:
        return "MALE";

      case Category.female:
        return "FEMALE";

      case Category.height:
        return "HEIGHT";

      case Category.weight:
        return "WEIGHT";

      case Category.age:
        return "AGE";
    }
  }
}
