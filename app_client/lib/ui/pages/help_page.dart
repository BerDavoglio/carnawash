import 'package:flutter/material.dart';

import '../ui.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

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
                      const Text(
                        'Help',
                        style: TextStyle(
                          fontSize: 24,
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
              const SizedBox(height: 25),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Talk to us!',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Do you need any help? Call us via chat, to find out your previous chat, please go to the history dashboard.',
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 10),
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
                      'Chat',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
