import 'package:flutter/material.dart';
import 'package:quizzly/ui/pages/quiz_page.dart';
import 'package:quizzly/ui/pages/start_page.dart';
import 'package:quizzly/ui/ui_constants.dart';
import 'package:quizzly/ui/utils/answer_button.dart';

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
          width: double.infinity,
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              Text(
                "You did it!",
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w600,
                    fontFamily: kAlike),
              ),
              Spacer(),
              Text(
                "Your Score is",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    fontFamily: kAlike),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                score.toString(),
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    fontFamily: kAlike),
              ),
              Spacer(),
              AnswerButton(
                isButtonDisabled: false,
                size: Size(310, 50),
                text: "Choose another format",
                textStyle: TextStyle(fontSize: 17, fontFamily: kAlike),
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
                      builder: (context) => QuizPage(
                        category: previousConfig[0],
                        difficulty: previousConfig[1],
                        questionNumber: previousConfig[2],
                        topic: previousConfig[3],
                      ),
                    ),
                  );
                },
                child: Text(
                  "Try again",
                  style: TextStyle(fontSize: 17, fontFamily: kAlike),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
