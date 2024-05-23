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
      return "Please enter a valid email address.";
    }
  }

  String? validatePw(String? input) {
    // TODO: implementiere hier die Logik, die im Task Sheet beschrieben ist
    return null;
  }
}

bool validateEmailFn(String email) {
  final emailRegex = RegExp(
      r"[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\.[a-zA-Z]{2,}");
  return emailRegex.hasMatch(email);
}
