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
      backgroundColor: Colors.grey[100]!,
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
                          const Text(
                            'Wallet',
                            style: TextStyle(
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
                    children: [
                      creditcardBox(),
                      creditcardBox(),
                      creditcardBox(),
                      creditcardBox(),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    WalletEditPage(initial: false),
                              ),
                            );
                          },
                          child: const Text(
                            'Register another credit card',
                            style: TextStyle(
                              color: Color.fromRGBO(237, 189, 58, 1),
                              fontWeight: FontWeight.bold,
                            ),
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

  Widget creditcardBox() {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
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
                            padding: const EdgeInsets.only(top: 10),
                            splashRadius: 26,
                            iconSize: 26,
                            visualDensity: const VisualDensity(
                              horizontal: VisualDensity.minimumDensity,
                              vertical: VisualDensity.minimumDensity,
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      WalletEditPage(initial: true),
                                ),
                              );
                            },
                            icon: const Icon(Icons.edit_outlined)),
                        IconButton(
                            padding: const EdgeInsets.only(top: 10),
                            splashRadius: 26,
                            iconSize: 26,
                            visualDensity: const VisualDensity(
                              horizontal: VisualDensity.minimumDensity,
                              vertical: VisualDensity.minimumDensity,
                            ),
                            onPressed: () {},
                            icon: const Icon(Icons.delete_outline)),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 11),
                const Text(
                  '**** **** **** 1234',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Jorge Williams',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 8),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '12/31',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      '***',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
