// import 'package:flutter/material.dart';
import 'package:quizzly/app_logic/logic_handlers/network_helper.dart';
import 'package:quizzly/app_logic/models/question.dart';
import 'package:html_unescape/html_unescape_small.dart';

class OpenTriviaHandler {
  final int category;
  final String difficulty;
  final int questionNumber;
  late String apiURL;

  OpenTriviaHandler(
      {required this.category,
      required this.difficulty,
      required this.questionNumber});

  Future getQuestionData() async {
    // If category is "Any" => category == -1
    if (category == -1) {
      apiURL =
          "https://opentdb.com/api.php?amount=$questionNumber&difficulty=$difficulty&type=multiple";
    } else {
       apiURL =
          "https://opentdb.com/api.php?amount=$questionNumber&category=$category&difficulty=$difficulty&type=multiple";
    } 
    // unescaper init
    HtmlUnescape unescaper = HtmlUnescape();
    NetworkHelper networkHelper = NetworkHelper(apiURL);
    List<Question> questionList = [];
    var response = await networkHelper.getData();
    // convert the incorrect answer list
    for (var question in response['results']) {
      List<String> allAnswers = [unescaper.convert(question['correct_answer'])];
      for (var answer in question['incorrect_answers']) {
        allAnswers.add(
          unescaper.convert(answer.toString()),
        );
      }
      // randomize the answers
      allAnswers.shuffle();
      questionList.add(
        Question(
          correctAnswer: unescaper.convert(question["correct_answer"]),
          allAnswers: allAnswers,
          questionText: unescaper.convert(question["question"]),
        ),
      );
    }
    return questionList;
  }
}
