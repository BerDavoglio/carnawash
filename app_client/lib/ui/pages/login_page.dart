import 'package:flutter/material.dart';

import '../ui.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    Key? key,
    this.index = 1,
  }) : super(key: key);

  final int index;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  height: 300,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(200),
                      bottomRight: Radius.circular(200),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: Center(
                      child: Image(
                        width: 250,
                        image: AssetImage('images/brand-logo.png'),
                      ),
                    ),
                  ),
                ),
                widget.index == 1
                    ? SignInComponent(
                        emailController: emailController,
                        passwordController: passwordController,
                      )
                    : widget.index == 2
                        ? const RegisterComponent()
                        : const ChangePassComponent(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
