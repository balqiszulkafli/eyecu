class Question {
  final String id;
  final String questionText;
  final List<Answer> answersList;

  Question(this.id, this.questionText, this.answersList);
}

class Answer {
  final String answerText;
  final bool isCorrect;

  Answer(this.answerText, this.isCorrect);
}

class Check {
  final String id;
  final String userAnswer;

  Check(this.id, this.userAnswer);

  String get getID => id;
  String get getUserAnswer => userAnswer;

}
