import 'package:flutter/material.dart';

import '../ui.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  bool edit = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: navigationBarComponent(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 50,
            left: 25,
            right: 25,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      backButtonComponent(context),
                      const Text(
                        'My Account Information',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  notificationGeralButtonComponent(context),
                ],
              ),
              const SizedBox(height: 15),
              !edit
                  ? Column(
                      children: [
                        geralInativeTextInput(context: context, text: 'Name'),
                        geralInativeTextInput(context: context, text: 'Email'),
                        geralInativeTextInput(
                            context: context, text: 'Phone Number'),
                        geralInativeTextInput(
                            context: context, text: 'Address'),
                        const SizedBox(height: 10),
                        const Text(
                          'Edit Information',
                          style: TextStyle(
                            color: Colors.amber,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        geralTextInput(
                          context: context,
                          text: 'Name',
                          textController: nameController,
                        ),
                        geralTextInput(
                          context: context,
                          text: 'E-mail',
                          textController: emailController,
                        ),
                        geralTextInput(
                          context: context,
                          text: 'Phone Number',
                          textController: phoneController,
                        ),
                        geralTextInput(
                          context: context,
                          text: 'Address',
                          textController: addressController,
                        ),
                        TextButton(
                          style: ButtonStyle(
                            elevation: MaterialStateProperty.all(5),
                            fixedSize: MaterialStateProperty.all<Size>(
                              Size(MediaQuery.of(context).size.width * 0.9, 50),
                            ),
                            backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.amber,
                            ),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                          onPressed: () {},
                          child: const Text(
                            'Save',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
