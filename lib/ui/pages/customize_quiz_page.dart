import 'package:flutter/material.dart';
import 'package:training_app_2/app_logic/logic_handlers/json_handeler.dart';
import 'package:training_app_2/ui/pages/quiz_page.dart';
import 'package:training_app_2/ui/utils/answer_button.dart';
import 'package:training_app_2/ui/utils/dropdown_online.dart';
import 'package:training_app_2/app_logic/extensions/string_cases.dart';

class CustomizeQuizPage extends StatefulWidget {
  @override
  _CustomizeQuizPageState createState() => _CustomizeQuizPageState();
}

class _CustomizeQuizPageState extends State<CustomizeQuizPage> {
  final jsonHandeler = JsonHandeler();
  late Future<Map<int, String>> _future;

  @override
  void initState() {
    _future = jsonHandeler.parseJson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Customize Quiz"),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 40, bottom: 30, left: 30, right: 30),
        child: FutureBuilder(
          future: _future,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return CustomizeQuizPageContents(apiMap: snapshot.data);
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}

class CustomizeQuizPageContents extends StatefulWidget {
  final apiMap;

  CustomizeQuizPageContents({required this.apiMap});

  @override
  _CustomizeQuizPageContentsState createState() =>
      _CustomizeQuizPageContentsState();
}

class _CustomizeQuizPageContentsState extends State<CustomizeQuizPageContents> {
  int? _category = -1;
  int? _questions = 10;
  String? _difficulty = "easy";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppDropdownInput<int>(
          hintText: "Choose a Category",
          options: widget.apiMap.keys.toList(),
          controller: _category!,
          onChanged: (int? value) {
            setState(() {
              _category = value;
              // state.didChange(newValue);
            });
          },
          getLabel: (int value) {
            return widget.apiMap[value]!;
          },
        ),
        Spacer(),
        AppDropdownInput<String>(
          hintText: "Choose a difficulty",
          options: ['easy', 'medium', 'hard'],
          controller: _difficulty!,
          onChanged: (String? value) {
            setState(() {
              _difficulty = value;
              // state.didChange(newValue);
            });
          },
          getLabel: (String value) => value.inCaps,
        ),
        Spacer(),
        AppDropdownInput<int>(
          hintText: "Number of questions",
          options: [10, 15, 20, 25, 30, 35, 40, 45, 50],
          controller: _questions!,
          onChanged: (int? value) {
            setState(() {
              _questions = value;
              // state.didChange(newValue);
            });
          },
          getLabel: (int value) => value.toString(),
        ),
        Spacer(
          flex: 4,
        ),
        AnswerButton(
          isButtonDisabled: false,
          size: Size(310, 50),
          text: "Start Quiz",
          textStyle: TextStyle(fontSize: 18),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return QuizPage(
                    category: _category!,
                    difficulty: _difficulty!,
                    questionNumber: _questions!,
                    topic: widget.apiMap[_category],
                  );
                },
              ),
            );
          },
        )
      ],
    );
  }
}
