class Choice {
  String? choice;
  int? destinaton;

  Choice({required this.choice, this.destinaton});
}

class Story {
  String text;
  Choice choice1;
  Choice? choice2;

  Story({required this.text, required this.choice1, this.choice2});
}
