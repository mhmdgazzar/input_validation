import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  // Attribute
  final passwordController = TextEditingController();
  final repeatPasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool clickable = false;

  // Methoden
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

  String? validatePwRepeat(String? input) {
    if (input == null || input.isEmpty) {
      return "Bitte bestätigen Sie Ihr Passwort";
    } else if (input != passwordController.text) {
      return "Passwörter stimmen nicht überein";
    } else {
      return null;
    }
  }

  bool validateEmailFn(String email) {
    final emailRegex = RegExp(
        r"[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\.[a-zA-Z]{2,}");
    return emailRegex.hasMatch(email);
  }

  @override
  void dispose() {
    passwordController.dispose();
    repeatPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Form(
              key: _formKey,
              onChanged: () {
                setState(() {
                  clickable = _formKey.currentState?.validate() ?? false;
                });
              },
              child: Column(children: [
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Email"),
                    suffixText: '*',
                    suffixStyle: TextStyle(color: Colors.red),
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: validateEmail,
                ),
                const SizedBox(height: 8),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Passwort"),
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: validatePw,
                  controller: passwordController,
                ),
                const SizedBox(height: 8),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Passwort wiederholnen"),
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: validatePwRepeat,
                  controller: repeatPasswordController,
                ),
                const SizedBox(height: 32),
                FilledButton(
                  onPressed: clickable ? () {} : null,
                  child: const Text("Login"),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
