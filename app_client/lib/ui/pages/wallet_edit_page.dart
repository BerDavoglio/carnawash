// ignore_for_file: no_logic_in_create_state, must_be_immutable

import 'package:flutter/material.dart';

import '../ui.dart';

class WalletEditPage extends StatefulWidget {
  bool? initial;
  WalletEditPage({
    super.key,
    required this.initial,
  });

  @override
  State<WalletEditPage> createState() => _WalletEditPageState(
        initial: initial,
      );
}

class _WalletEditPageState extends State<WalletEditPage> {
  TextEditingController numberController = TextEditingController();
  TextEditingController holderController = TextEditingController();
  TextEditingController expiresController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  bool? initial;
  late bool edit;

  _WalletEditPageState({required this.initial});

  @override
  void initState() {
    super.initState();

    edit = initial!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: navigationBarComponent(context),
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.85,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 50,
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
                          Text(
                            edit ? 'Edit Credit Card' : 'Register Credit Card',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                      notificationGeralButtonComponent(context),
                    ],
                  ),
                  const SizedBox(height: 16),
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
                            Size(MediaQuery.of(context).size.width * 0.85, 50),
                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.amber,
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
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
        ),
      ),
    );
  }
}
