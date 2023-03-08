import 'package:flutter/material.dart';
import 'package:scjr1/widgets/rounded_button.dart';

class MenuScreen extends StatelessWidget {
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
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
