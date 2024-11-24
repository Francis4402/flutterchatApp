import 'package:chatapp/auth/auth_service.dart';
import 'package:flutter/material.dart';

import '../components/my_buttons.dart';
import '../components/text_fields.dart';

class RegisterPage extends StatelessWidget {

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _pwController = TextEditingController();

  final TextEditingController _confirmpwController = TextEditingController();

  final void Function()? onTap;

  RegisterPage({super.key, this.onTap});

  void register(context) {
    final auth = AuthService();

    if (_pwController.text == _confirmpwController.text) {
      try {
        auth.signUpWithEmailPassword(_nameController.text, _emailController.text, _pwController.text);
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(title: Text(e.toString())),
        );
      }
    } else {
      showDialog(
          context: context,
          builder: (context) => const AlertDialog(
                title: Text("Passwords don't match!"),
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              "Register here",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primary, fontSize: 16),
            ),
            const SizedBox(
              height: 25,
            ),
            TextFields(
              hintText: 'Name',
              obsecureText: false,
              controller: _nameController,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFields(
              hintText: 'Email',
              obsecureText: false,
              controller: _emailController,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFields(
              hintText: 'Password',
              obsecureText: true,
              controller: _pwController,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFields(
              hintText: 'Confirm Password',
              obsecureText: true,
              controller: _confirmpwController,
            ),
            const SizedBox(
              height: 25,
            ),
            MyButtons(
              text: 'Register',
              onTap: () => register(context),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account",
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "Login",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
