import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/rounded_button.dart';

class PersonalCardScreen extends StatelessWidget {
  const PersonalCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
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
                text: '11 12345-6789',
                onPressed: () {
                  final url = Uri.parse(
                    'whatsapp://send?phone=11123456789',
                  );
                  launchUrl(url);
                },
                backgroundColor: Colors.white,
                textColor: Colors.teal,
              ),
              const SizedBox(height: 16),
              RoundedButton(
                icon: Icons.email,
                text: 'teste@gmail.com',
                onPressed: () {
                  launchUrl(Uri(
                    scheme: 'mailto',
                    path: 'teste@gmail.com',
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