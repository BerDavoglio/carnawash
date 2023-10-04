import 'package:flutter/material.dart';

import '../ui.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  bool enable = true;
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
                        'Notification Settings',
                        style: TextStyle(
                          fontSize: 20,
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
              Row(
                children: [
                  Switch(
                    value: enable,
                    activeColor: Colors.amber,
                    onChanged: (bool value) {
                      setState(() {
                        enable = value;
                      });
                    },
                  ),
                  const Text('Push Notifications',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
