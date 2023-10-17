import 'package:flutter/material.dart';

import '../ui.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
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
                    children: [
                      backButtonComponent(context),
                      const Text(
                        'Notification',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 24),
                  notificationBox(
                    context,
                    'Support responded to chat',
                    '1 hour ago',
                    Icons.chat_bubble_outline,
                  ),
                  notificationBox(
                    context,
                    'Your Nissan wash request has been approved',
                    '1 hour ago',
                    Icons.check_circle_outline,
                  ),
                  notificationBox(
                    context,
                    'Your Nissan wash request has been rejected',
                    '1 hour ago',
                    Icons.close,
                  ),
                  notificationBox(
                    context,
                    'Your wash has started!',
                    '1 hour ago',
                    Icons.directions_car,
                  ),
                  notificationBox(
                    context,
                    'Your wash has finished. Rate us!',
                    '1 hour ago',
                    Icons.directions_car,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget notificationBox(
    BuildContext context,
    String text,
    String time,
    IconData icon,
  ) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.85,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 24),
                  child: Icon(
                    icon,
                    size: 30,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Text(
                        text,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                    const SizedBox(height: 6),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Text(
                        time,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
