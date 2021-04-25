import 'package:flutter/material.dart';
import 'package:training_app_2/ui/pages/start_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData.dark().copyWith(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
          ),
        ),
      ),
      home: StartPage(),
      // routes: {
      //   StartPage.id: (context) => StartPage(),
      //   EndPage.id: (context) => EndPage(),
      //   QuizPage.id: (context) => QuizPage(),
      // },
      // initialRoute: QuizPage.id,
    );
  }
}
