import 'package:quizzly/ui/pages/customize_quiz_page.dart';
import 'package:quizzly/ui/utils/category_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:quizzly/ui/ui_constants.dart';

class StartPage extends StatelessWidget {
  static const String id = "start";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: StartPageBody(),
    );
  }
}

class StartPageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Quizzly",
              style: TextStyle(fontSize: 41, fontFamily: kQuando),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 60,
            ),
            Text(
              "Choose a quiz format to play".toUpperCase(),
              textAlign: TextAlign.center,
              style: TextStyle(fontFamily: kQuando, fontSize: 17.5),
            ),
            SizedBox(
              height: 22,
            ),
            CategoryButton(
              icon: Icons.computer,
              child: "Science: Computers",
              difficulty: kEasy,
              categoryID: 18,
              questions: 10,
            ),
            CategoryButton(
              icon: Icons.movie_filter,
              child: "Entertainment: Film",
              difficulty: kEasy,
              categoryID: 11,
              questions: 20,
            ),
            CategoryButton(
              icon: Icons.car_rental,
              child: "Vehicles",
              difficulty: kMedium,
              categoryID: 28,
              questions: 10,
            ),
            CategoryButton(
              child: "General Knowledge",
              icon: Icons.bookmark,
              difficulty: kMedium,
              categoryID: 9,
              questions: 20,
            ),
            CategoryButton(
              icon: Icons.history_edu,
              child: "History",
              difficulty: kHard,
              categoryID: 23,
              questions: 30,
            ),
            Spacer(),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CustomizeQuizPage(),
                  ),
                );
              },
              child: Text(
                "Make Your Own Quiz Format",
                style: TextStyle(fontSize: 15, fontFamily: kQuando),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
