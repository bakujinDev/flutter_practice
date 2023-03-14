import 'package:flutter/material.dart';
import 'package:flutter_practice/features/destini/data/story_brain.dart';

StoryBrain storyBrain = StoryBrain();

class DestiniScreen extends StatefulWidget {
  const DestiniScreen({super.key});

  @override
  State<DestiniScreen> createState() => _DestiniScreenState();
}

class _DestiniScreenState extends State<DestiniScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/B_destini.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 12,
                  child: Center(
                    child: Text(
                      storyBrain.getStory(storyBrain.page).text,
                      style: const TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: GestureDetector(
                    onTap: () {
                      storyBrain.page = storyBrain
                              .getStory(storyBrain.page)
                              .choice1
                              .destinaton ??
                          0;
                      setState(() {});
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Center(
                        child: Text(
                          storyBrain.getStory(storyBrain.page).choice1.choice ??
                              '',
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                if (storyBrain.getStory(storyBrain.page).choice2 != null)
                  Expanded(
                    flex: 2,
                    child: GestureDetector(
                      onTap: () {
                        storyBrain.page = storyBrain
                                .getStory(storyBrain.page)
                                .choice2
                                ?.destinaton ??
                            0;
                        setState(() {});
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Center(
                          child: Text(
                            storyBrain
                                    .getStory(storyBrain.page)
                                    .choice2
                                    ?.choice ??
                                '',
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
