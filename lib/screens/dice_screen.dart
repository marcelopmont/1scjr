import 'dart:math';

import 'package:flutter/material.dart';

class DiceScreen extends StatefulWidget {
  static const String id = '/dice_screen';

  const DiceScreen({super.key});

  @override
  State<DiceScreen> createState() => _DiceScreenState();
}

class _DiceScreenState extends State<DiceScreen> {
  int dice1 = 3;
  int dice2 = 5;

  Random random = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () => onDicePressed(),
                    child: Image.asset('assets/images/dice$dice1.png'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: InkWell(
                    onTap: () => onDicePressed(),
                    child: Image.asset('assets/images/dice$dice2.png'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onDicePressed() {
    setState(() {
      dice1 = random.nextInt(6) + 1;
      dice2 = random.nextInt(6) + 1;
    });
  }
}
