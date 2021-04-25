import 'package:training_app_2/ui/pages/customize_quiz_page.dart';
import 'package:training_app_2/ui/utils/category_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:training_app_2/ui/ui_constants.dart';

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
        padding: const EdgeInsets.all(30),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "My Quiz App",
              style: TextStyle(fontSize: 40),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Catch Phrase",
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Choose a category to compete".toUpperCase(),
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: 30,
            ),
            CategoryButton(),
            CategoryButton(),
            CategoryButton(),
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
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
