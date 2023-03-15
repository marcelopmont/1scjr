class QuestionModel {
  QuestionModel({
    required this.question,
    required this.options,
    required this.answerIndex,
  });

  final String question;
  final List<String> options;
  final int answerIndex;
}
