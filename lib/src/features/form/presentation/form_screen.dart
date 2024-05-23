import 'package:flutter/material.dart';

class FormScreen extends StatelessWidget {
  // Attribute
  // (keine)

  // Konstruktor
  const FormScreen({super.key});

  // Methoden
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Form(
              child: Column(children: [
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Email"),
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: validateEmail,
                ),
                const SizedBox(height: 8),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Passwort"),
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: validatePw,
                ),
                const SizedBox(height: 8),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Passwort wiederholnen"),
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: validatePw,
                ),
                const SizedBox(height: 32),
                FilledButton(
                  onPressed: () {},
                  child: const Text("Login"),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }

  String? validateEmail(String? input) {
    if (validateEmailFn(input!) || input.isEmpty) {
      return null;
    } else {
      return "Bitte eine valide E-Mail-Adresse eingeben";
    }
  }

  String? validatePw(String? input) {
    if (input == null || input.isEmpty) {
      return "Passwort kann nicht leer sein";
    } else if (input.length < 8) {
      return "Passwort muss minimum 8 Zeichen lang sein";
    } else {
      return null;
    }
  }
}

bool validateEmailFn(String email) {
  final emailRegex = RegExp(
      r"[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\.[a-zA-Z]{2,}");
  return emailRegex.hasMatch(email);
}
