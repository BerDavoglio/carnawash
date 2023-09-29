import 'package:flutter/material.dart';

import '../../ui.dart';

class SignInComponent extends StatelessWidget {
  const SignInComponent({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              const Text(
                'Sign In',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              geralTextInput(
                context: context,
                text: 'E-mail',
                textController: emailController,
              ),
              const SizedBox(
                height: 10,
              ),
              passwordTextInput(
                context,
                passwordController,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Forgot Password',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                fixedSize: Size(MediaQuery.of(context).size.width * 0.9, 50)),
            onPressed: () {},
            child: const Text('Login'),
          ),
        ),
        const Text(
          "Don't have an Account?",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
