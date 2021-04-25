class Question {
  String questionText;
  List allAnswers;
  String correctAnswer;

  Question(
      {required this.correctAnswer,
      required this.allAnswers,
      required this.questionText});

  bool isCorrect(int index) {
    return (correctAnswer == allAnswers[index]);
  }
}
