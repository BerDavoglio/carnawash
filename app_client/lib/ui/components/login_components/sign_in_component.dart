import 'package:flutter/material.dart';

import '../../ui.dart';

class SignInComponent extends StatefulWidget {
  const SignInComponent({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  State<SignInComponent> createState() => _SignInComponentState();
}

class _SignInComponentState extends State<SignInComponent> {
  bool hidden = true;

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
                textController: widget.emailController,
              ),
              const SizedBox(
                height: 10,
              ),
              passwordTextInput(
                context,
                widget.passwordController,
                () => setState(() {
                  hidden = !hidden;
                }),
                hidden,
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Forgot Password',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 5, left: 5, right: 5),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                fixedSize: Size(MediaQuery.of(context).size.width * 0.9, 50)),
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.HOME);
            },
            child: const Text('Login'),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            "Don't have an Account?",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
