import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/rounded_button.dart';

class PersonalCardScreen extends StatelessWidget {
  static const String id = '/personal_card_screen';

  const PersonalCardScreen({
    super.key,
    required this.arguments,
  });

  final PersonalCardScreenArguments arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage(
                  'assets/images/profile.jpg',
                ),
                radius: 90,
              ),
              const SizedBox(
                height: 16,
                width: double.infinity,
              ),
              const Text(
                'Marcelo P Montanher',
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontFamily: 'mynerve',
                ),
              ),
              const SizedBox(height: 32),
              RoundedButton(
                icon: Platform.isAndroid
                    ? Icons.phone_android
                    : Icons.phone_iphone,
                text: arguments.phoneNumber,
                onPressed: () {
                  final url = Uri.parse(
                    'whatsapp://send?phone=${arguments.phoneNumber}',
                  );
                  launchUrl(url);
                },
                backgroundColor: Colors.white,
                textColor: Colors.teal,
              ),
              const SizedBox(height: 16),
              RoundedButton(
                icon: Icons.email,
                text: arguments.emailAddress,
                onPressed: () {
                  launchUrl(Uri(
                    scheme: 'mailto',
                    path: arguments.emailAddress,
                    query: 'subject=Aula Teste&body=Body Test',
                  ));
                },
                backgroundColor: Colors.white,
                textColor: Colors.teal,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PersonalCardScreenArguments {
  const PersonalCardScreenArguments({
    required this.phoneNumber,
    required this.emailAddress,
  });

  final String phoneNumber;
  final String emailAddress;
}
