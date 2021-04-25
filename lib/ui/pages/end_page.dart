import 'package:flutter/material.dart';
import 'package:training_app_2/ui/pages/quiz_page.dart';
import 'package:training_app_2/ui/pages/start_page.dart';
import 'package:training_app_2/ui/ui_constants.dart';
import 'package:training_app_2/ui/utils/category_button.dart';

class EndPage extends StatelessWidget {
  static const String id = "end";

  final List previousConfig;
  final int score;

  EndPage({required this.score, required this.previousConfig});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
      child: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Text(
              "You did it!",
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.w600),
            ),
            Spacer(),
            Text(
              "Your Score is",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
            Text(
              score.toString(),
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
            Spacer(),
            CategoryButton(
              child: Text(
                "Choose another format",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 17),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StartPage(),
                  ),
                );
              },
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuizPage(category: previousConfig[0], difficulty: previousConfig[1], questionNumber: previousConfig[2],),
                  ),
                );
              },
              child: Text(
                "Try again",
                style: TextStyle(fontSize: 17),
              ),
            ),
          ],
        ),
      ),
    ),
    );
  }
}

