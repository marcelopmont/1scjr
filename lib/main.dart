// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scjr1/widgets/rounded_button.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

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
              CircleAvatar(
                backgroundImage: AssetImage(
                  'assets/images/profile.jpg',
                ),
                radius: 90,
              ),
              SizedBox(
                height: 16,
                width: double.infinity,
              ),
              Text(
                'Marcelo P Montanher',
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontFamily: 'mynerve',
                ),
              ),
              SizedBox(height: 32),
              RoundedButton(
                icon: Platform.isAndroid
                    ? Icons.phone_android
                    : Icons.phone_iphone,
                text: '11 12345-6789',
                onPressed: () {
                  launchUrl(Uri(
                    scheme: 'tel',
                    path: '+55 11 12345-6789',
                  ));
                },
              ),
              SizedBox(height: 16),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
