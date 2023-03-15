import 'package:flutter/material.dart';
import 'package:scjr1/screens/quiz/models/question_model.dart';

class QuizScreen extends StatefulWidget {
  static const String id = '/quiz_screen';

  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  var questions = [];
  var questionIndex = 0;
  var score = 0;

  @override
  void initState() {
    questions = _loadQuestions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(),
      ),
    );
  }

  List<QuestionModel> _loadQuestions() {
    return [
      QuestionModel(
        question: 'Qual o maior produtor de café do mundo?',
        options: ['Brasil', 'Estados Unidos', 'Africa do Sul', 'Nigeria'],
        answerIndex: 0,
      )
    ];
  }
}
