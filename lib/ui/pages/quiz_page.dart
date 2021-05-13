import 'dart:async';
import 'package:flutter/material.dart';
import 'package:quizzly/app_logic/models/question.dart';
import 'package:quizzly/ui/pages/end_page.dart';
import 'package:quizzly/ui/ui_constants.dart';
import 'package:quizzly/app_logic/logic_handlers/trivia_handler.dart';
import 'package:quizzly/ui/utils/answer_button.dart';

class QuizPage extends StatefulWidget {
  final int category;
  final String difficulty;
  final int questionNumber;
  final String topic;

  QuizPage(
      {required this.category,
      required this.difficulty,
      required this.questionNumber,
      required this.topic});

  static const String id = "quiz";
  late final questions;

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  late final Future<List<Question>> questionList;
  late Future _future;

  @override
  void initState() {
    widget.questions = OpenTriviaHandler(
        category: widget.category,
        difficulty: widget.difficulty,
        questionNumber: widget.questionNumber);
    _future = widget.questions.getQuestionData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return QuizContents(
              questionList: snapshot.data,
              previousConfig: [
                widget.category,
                widget.difficulty,
                widget.questionNumber,
                widget.topic,
              ],
            );
          } else if (snapshot.hasError) {
            print("error");
            return Scaffold(
              body: Center(
                child: Text("An Error has occured. Please try again later."),
              ),
            );
          } else {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}

class QuizContents extends StatefulWidget {
  final questionList;
  final List previousConfig;
  QuizContents({this.questionList, required this.previousConfig});
  @override
  _QuizContentsState createState() => _QuizContentsState(questionList);
}

class _QuizContentsState extends State<QuizContents> {
  final _questionList;
  _QuizContentsState(this._questionList);
  int _score = 0;
  int _currentQuestion = 0;
  List<Color> answerButtonColors = [...defaultColorList];
  double _progress = 1.0;
  bool _isButtonDisabled = false;

  late Timer _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void quizOver() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => EndPage(
          score: _score,
          previousConfig: widget.previousConfig,
        ),
      ),
    );
  }

  void nextQuestion() {
    if (_currentQuestion == _questionList.length - 1) {
      _timer.cancel();
      quizOver();
    } else {
      setState(() {
        answerButtonColors = [...defaultColorList];
        _progress = 1.0;
        _isButtonDisabled = false;
        ++_currentQuestion;
      });
    }
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(milliseconds: 12), (timer) {
      if (_progress <= 0.00001) {
        nextQuestion();
      }
      setState(() {
        _progress -= 0.001;
        // print(_progress);
      });
    });
  }

  void checkAnswer(int index, Question question) {
    setState(() {
      _isButtonDisabled = true;
    });

    if (question.isCorrect(index)) {
      setState(() {
        ++_score;
        answerButtonColors[index] = Colors.green;
      });
    } else {
      setState(() {
        answerButtonColors[index] = Colors.redAccent;
      });
    }

    Timer(Duration(milliseconds: 1250), nextQuestion);
  }

  @override
  Widget build(BuildContext context) {
    Question activeQuestion = _questionList[_currentQuestion];
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4),
          child: LinearProgressIndicator(
            backgroundColor: Colors.grey.shade600,
            valueColor: const AlwaysStoppedAnimation(Colors.white70),
            value: _progress,
          ),
        ),
        title: Text(widget.previousConfig[3],
            style: TextStyle(
              fontFamily: kQuando,
            )),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              child: Center(
                child: Text(
                  activeQuestion.questionText,
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 22, fontFamily: kAlike),
                ),
              ),
            ),
            Spacer(),
            // TODO Make all the button same in size when a longer answer is present
            ...activeQuestion.allAnswers.map(
              (i) {
                int activeIndex = activeQuestion.allAnswers.indexOf(i);
                return AnswerButton(
                  text: i,
                  color: answerButtonColors[activeIndex],
                  isButtonDisabled: _isButtonDisabled,
                  onPressed: () {
                    checkAnswer(activeIndex, activeQuestion);
                  },
                );
              },
            ),
            Spacer()
          ],
        ),
      )),
    );
  }
}
