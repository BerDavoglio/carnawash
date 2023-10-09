import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../ui.dart';

class FirstLoginComponent extends StatefulWidget {
  const FirstLoginComponent({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.phoneController,
    required this.addressController,
    required this.abnController,
    required this.driveController,
    required this.pictureController,
    required this.accountNameController,
    required this.accountNumberController,
  });

  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController addressController;
  final TextEditingController abnController;
  final TextEditingController driveController;
  final TextEditingController pictureController;
  final TextEditingController accountNameController;
  final TextEditingController accountNumberController;

  @override
  State<FirstLoginComponent> createState() => _FirstLoginComponentState();
}

class _FirstLoginComponentState extends State<FirstLoginComponent> {
  List<String> listBank = ['Bank 1', 'Bank 2', 'Bank 3'];
  String? bankSelected;
  int n = 1;

  @override
  void initState() {
    super.initState();

    bankSelected = listBank[0];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              Text(
                n == 1 ? 'Basic Account Info' : 'Bank Info',
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              n == 1
                  ? Column(
                      children: [
                        geralTextInput(
                          context: context,
                          text: 'Name',
                          textController: widget.nameController,
                        ),
                        geralTextInput(
                          context: context,
                          text: 'E-mail',
                          textController: widget.emailController,
                        ),
                        geralTextInput(
                          context: context,
                          text: 'Phone Number',
                          textController: widget.phoneController,
                        ),
                        geralTextInput(
                          context: context,
                          text: 'Address',
                          textController: widget.addressController,
                        ),
                        geralTextInput(
                          context: context,
                          text: 'ABN',
                          textController: widget.abnController,
                        ),
                        geralIconTextInput(
                          context: context,
                          text: "Driver's Licence or Passport",
                          textController: widget.driveController,
                          icon: Icons.file_download_outlined,
                        ),
                        geralIconTextInput(
                          context: context,
                          text: "Profile Picture",
                          textController: widget.pictureController,
                          icon: Icons.file_download_outlined,
                        ),
                      ],
                    )
                  : Column(children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey[700]!),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        child: DropdownButton(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 10,
                          ),
                          value: bankSelected,
                          items: listBank
                              .map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(item),
                                  ))
                              .toList(),
                          onChanged: (item) => setState(() {
                            bankSelected = item!;
                          }),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      geralTextInput(
                        context: context,
                        text: 'Account Name',
                        textController: widget.accountNameController,
                      ),
                      geralTextInput(
                        context: context,
                        text: 'Account Number',
                        textController: widget.accountNumberController,
                      ),
                    ]),
              const SizedBox(
                height: 10,
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
              if (n == 1) {
                setState(() {
                  n = 2;
                });
              } else {
                Navigator.of(context)
                    .pushReplacementNamed(AppRoutes.FIRST_LOGIN_HOME);
              }
            },
            child: Text(n == 1 ? 'Next' : 'Confirm'),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            "Back",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: 20,
            ),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  const TextSpan(
                    text:
                        'By creating an account I agree to the terms and conditions of our ',
                    style: TextStyle(color: Colors.white),
                  ),
                  TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () =>
                          Navigator.of(context).pushNamed(AppRoutes.TERMS),
                    text: 'Terms of Service',
                    style: const TextStyle(
                      color: Colors.amber,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  const TextSpan(
                    text: '.',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
