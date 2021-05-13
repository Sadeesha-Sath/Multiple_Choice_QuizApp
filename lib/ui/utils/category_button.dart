import 'package:flutter/material.dart';
import 'package:quizzly/ui/ui_constants.dart';
import 'package:quizzly/ui/pages/quiz_page.dart';

class CategoryButton extends StatelessWidget {
  final String child;
  final IconData icon;
  final String difficulty;
  final int questions;
  final int categoryID;

  CategoryButton({
    required this.child,
    required this.icon,
    required this.questions,
    required this.difficulty,
    required this.categoryID,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 17),
      child: Material(
        borderRadius: BorderRadius.circular(50),
        color: difficulty == "easy"
            ? Colors.green
            : difficulty == "medium"
                ? Colors.yellowAccent.shade700
                : Colors.redAccent,
        child: InkWell(
          borderRadius: BorderRadius.circular(50),
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return QuizPage(
                    category: categoryID,
                    difficulty: difficulty,
                    questionNumber: questions,
                    topic: child,
                  );
                },
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 40),
            child: ElevatedButton(
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(2),
                shadowColor: MaterialStateProperty.all(Colors.white70),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      bottomLeft: Radius.circular(50),
                    ),
                  ),
                ),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return QuizPage(
                        category: categoryID,
                        difficulty: difficulty,
                        questionNumber: questions,
                        topic: child,
                      );
                    },
                  ),
                );
              },
              child: ListTile(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 3),
                title: Text(
                  child,
                  style: TextStyle(fontFamily: kAlike, fontSize: 18),
                ),
                leading: Icon(icon),
                trailing: CircleAvatar(
                  child: Text(questions.toString()),
                  foregroundColor: Colors.white.withOpacity(0.9),
                  backgroundColor: Colors.blueGrey.shade700,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
