import 'package:flutter/material.dart';
import 'package:scjr1/screens/quiz/models/question_model.dart';
import 'package:scjr1/screens/quiz/quiz_final_score_screen.dart';
import 'package:scjr1/widgets/rounded_button.dart';

class QuizScreen extends StatefulWidget {
  static const String id = '/quiz_screen';

  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  var questions = <QuestionModel>[];
  var questionIndex = 0;
  var score = 0;

  @override
  void initState() {
    questions = _loadQuestions();
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[questionIndex];
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                currentQuestion.question,
                style: const TextStyle(
                  fontSize: 28,
                ),
              ),
              const SizedBox(height: 32),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: currentQuestion.options.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  return RoundedButton(
                    text: currentQuestion.options[index],
                    onPressed: () {
                      _onOptionPressed(index);
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<QuestionModel> _loadQuestions() {
    return [
      const QuestionModel(
          question: 'Qual é o país que mais produz café no mundo?',
          options: ['Canadá', 'Índia', 'Argentina', 'Brasil', 'Etiópia'],
          answerIndex: 3),
      const QuestionModel(
          question: 'País conhecido por ser o mais fechado do mundo',
          options: ['Myanmar', 'Coréia do Norte', 'Armênia', 'Iêmen', 'Vietnã'],
          answerIndex: 1),
      const QuestionModel(
          question: 'País que possui a Groelândia como território',
          options: [
            'Finlândia',
            'Canadá',
            'Reino Unido',
            'Estados Unidos',
            'Dinamarca'
          ],
          answerIndex: 4),
      const QuestionModel(
          question: 'País com a maior média de qi',
          options: ['China', 'Alemanha', 'Japão', 'Coréia do Sul', 'Noruega'],
          answerIndex: 3),
      const QuestionModel(
          question: 'País com maior IDH (índice de desenvolvimento humano)',
          options: ['Noruega', 'Reino Unido', 'Canadá', 'Holanda', 'México'],
          answerIndex: 0),
      const QuestionModel(
          question: 'Continente menos industrializado',
          options: ['África', 'Ásia', 'Oceania'],
          answerIndex: 0),
      const QuestionModel(
          question: 'País com maior comunidade japonesa fora do Japão',
          options: ['Estados Unidos', 'Brasil', 'Coréia do Sul'],
          answerIndex: 1),
    ];
  }

  void _onOptionPressed(int optionIndex) {
    final currentQuestion = questions[questionIndex];

    if (currentQuestion.answerIndex == optionIndex) {
      score++;
    }

    _goToNextQuestion();
  }

  void _goToNextQuestion() {
    if (questionIndex == questions.length - 1) {
      Navigator.pushReplacementNamed(
        context,
        QuizFinalScoreScreen.id,
        arguments: QuizFinalScoreScreenArguments(
          score: score,
        ),
      );
    } else {
      setState(() {
        questionIndex++;
      });
    }
  }
}
