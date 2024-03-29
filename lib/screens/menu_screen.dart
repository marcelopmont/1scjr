import 'package:flutter/material.dart';
import 'package:scjr1/screens/counter/ui/screens/counter_screen.dart';
import 'package:scjr1/screens/dice_screen.dart';
import 'package:scjr1/screens/personal_card_screen.dart';
import 'package:scjr1/screens/quiz/quiz_screen.dart';
import 'package:scjr1/widgets/rounded_button.dart';

import 'movies/ui/movies_screen.dart';

class MenuScreen extends StatelessWidget {
  static const String id = '/menu_screen';

  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Menu Inicial',
                style: TextStyle(
                  fontSize: 32,
                ),
              ),
              const SizedBox(height: 32),
              RoundedButton(
                text: 'Cartão Pessoal',
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    PersonalCardScreen.id,
                    arguments: const PersonalCardScreenArguments(
                      phoneNumber: '11 12345-6789',
                      emailAddress: 'teste@testinho.com',
                    ),
                  );
                },
              ),
              const SizedBox(height: 8),
              RoundedButton(
                text: 'Dado',
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    DiceScreen.id,
                  );
                },
              ),
              const SizedBox(height: 8),
              RoundedButton(
                text: 'Quiz',
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    QuizScreen.id,
                  );
                },
              ),
              const SizedBox(height: 8),
              RoundedButton(
                text: 'Filmes',
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    MoviesScreen.id,
                  );
                },
              ),
              const SizedBox(height: 8),
              RoundedButton(
                text: 'Contador',
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    CounterScreen.id,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
