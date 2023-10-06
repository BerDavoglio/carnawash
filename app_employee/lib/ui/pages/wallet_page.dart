import 'package:flutter/material.dart';

import '../ui.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
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
                        'Wallet',
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
              Column(
                children: [
                  creditcardBox(),
                  creditcardBox(),
                  creditcardBox(),
                  creditcardBox(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(AppRoutes.WALLET_EDIT);
                      },
                      child: const Text(
                        'Register another credit card',
                        style: TextStyle(
                            color: Colors.amber, fontWeight: FontWeight.bold),
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

  Widget creditcardBox() {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Image(
                      height: 30,
                      image: AssetImage('images/mastercard-logo.png'),
                    ),
                    Row(
                      children: [
                        IconButton(
                            padding: const EdgeInsets.all(0),
                            splashRadius: 20,
                            iconSize: 18.0,
                            onPressed: () {},
                            icon: const Icon(Icons.edit_outlined)),
                        IconButton(
                            padding: const EdgeInsets.all(0),
                            splashRadius: 20,
                            iconSize: 18.0,
                            onPressed: () {},
                            icon: const Icon(Icons.delete_outline)),
                      ],
                    ),
                  ],
                ),
                const Text(
                  '**** **** **** 1234',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const Text(
                  'Jorge Williams',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                const Text(
                  '12/31 - ***',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
