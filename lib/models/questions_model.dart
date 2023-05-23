class QuestionModel {
  QuestionModel(this.question, this.answerList);

  String question;
  List<String> answerList;

  List<String> get shuffledAnswer {
    final shuffledAnswers = List.of(answerList);
    shuffledAnswers.shuffle();
    return shuffledAnswers;
  }
}
