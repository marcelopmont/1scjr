import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scjr1/screens/menu_screen.dart';
import 'package:scjr1/widgets/rounded_button.dart';
import 'package:scjr1/widgets/rounded_text_field.dart';

class AuthScreen extends StatelessWidget {
  static const String id = '/auth_screen';

  AuthScreen({super.key});

  var inputtedEmail = '';
  var inputtedPassword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        overlayColor: MaterialStateProperty.all(Colors.transparent),
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    RoundedTextField(
                      label: 'Insira seu email',
                      textInputType: TextInputType.emailAddress,
                      onTextChange: (text) => inputtedEmail = text,
                    ),
                    const SizedBox(height: 16),
                    RoundedTextField(
                      label: 'Senha',
                      obscureText: true,
                      onTextChange: (text) => inputtedPassword = text,
                    ),
                    const SizedBox(height: 64),
                    RoundedButton(
                      text: 'Entrar',
                      onPressed: () => authenticateUser(context),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void authenticateUser(BuildContext context) {
    final firebaseAuth = FirebaseAuth.instance;

    firebaseAuth
        .signInWithEmailAndPassword(
      email: inputtedEmail,
      password: inputtedPassword,
    )
        .then(
      (userCredentials) {
        Navigator.pushReplacementNamed(context, MenuScreen.id);
      },
    ).onError(
      (error, stackTrace) {
        firebaseAuth
            .createUserWithEmailAndPassword(
          email: inputtedEmail,
          password: inputtedPassword,
        )
            .then((userCredentials) {
          Navigator.pushReplacementNamed(context, MenuScreen.id);
        }).onError(
          (FirebaseAuthException error, stackTrace) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  error.message ?? 'Ops, algo errado aconteceu',
                ),
              ),
            );
          },
        );
      },
    );
  }
}
