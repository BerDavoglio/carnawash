import 'package:flutter/material.dart';

import '../ui.dart';

class NotificationConfigPage extends StatefulWidget {
  const NotificationConfigPage({super.key});

  @override
  State<NotificationConfigPage> createState() => _NotificationConfigPageState();
}

class _NotificationConfigPageState extends State<NotificationConfigPage> {
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
                      backButtonComponent(context),
                      const Text(
                        'Notification Settings',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  notificationGeralButtonComponent(context),
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
                  const Text(
                    'Push Notifications',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
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
