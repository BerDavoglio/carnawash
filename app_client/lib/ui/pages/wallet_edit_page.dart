import 'package:flutter/material.dart';

import '../ui.dart';

class WalletEditPage extends StatefulWidget {
  const WalletEditPage({super.key});

  @override
  State<WalletEditPage> createState() => _WalletEditPageState();
}

class _WalletEditPageState extends State<WalletEditPage> {
  TextEditingController numberController = TextEditingController();
  TextEditingController holderController = TextEditingController();
  TextEditingController expiresController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  bool edit = false;

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
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.amber,
                          child: IconButton(
                            iconSize: 24,
                            color: Colors.white,
                            onPressed: () {},
                            icon: const Icon(
                              Icons.arrow_back,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        edit ? 'Edit Card' : 'Create Card',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  IconButton(
                    iconSize: 30,
                    onPressed: () {},
                    icon: const Icon(
                      Icons.notifications_outlined,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      geralTextInput(
                        context: context,
                        text: 'Number',
                        textController: numberController,
                      ),
                      geralTextInput(
                        context: context,
                        text: 'Cardholder Name',
                        textController: holderController,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          geralTextInput(
                            context: context,
                            text: 'Expires',
                            textController: expiresController,
                            larg: 0.4,
                          ),
                          geralTextInput(
                            context: context,
                            text: 'CVV',
                            textController: cvvController,
                            larg: 0.4,
                          ),
                        ],
                      ),
                      edit
                          ? const Text(
                              'Delete this credit card',
                              style: TextStyle(
                                color: Colors.amber,
                              ),
                            )
                          : const SizedBox(),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
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
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
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