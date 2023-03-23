import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:scjr1/screens/auth_screen.dart';
import 'package:scjr1/screens/dice_screen.dart';
import 'package:scjr1/screens/menu_screen.dart';
import 'package:scjr1/screens/movies/movies_screen.dart';
import 'package:scjr1/screens/personal_card_screen.dart';
import 'package:scjr1/screens/quiz/quiz_final_score_screen.dart';
import 'package:scjr1/screens/quiz/quiz_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      initialRoute: AuthScreen.id,
      routes: {
        MenuScreen.id: (context) => const MenuScreen(),
        PersonalCardScreen.id: (context) {
          final arguments = ModalRoute.of(context)?.settings.arguments
              as PersonalCardScreenArguments;
          return PersonalCardScreen(arguments: arguments);
        },
        DiceScreen.id: (context) => const DiceScreen(),
        QuizScreen.id: (context) => const QuizScreen(),
        QuizFinalScoreScreen.id: (context) {
          final arguments = ModalRoute.of(context)?.settings.arguments
              as QuizFinalScoreScreenArguments;
          return QuizFinalScoreScreen(arguments: arguments);
        },
        MoviesScreen.id: (context) => const MoviesScreen(),
        AuthScreen.id: (context) => AuthScreen(),
      },
    );
  }
}
