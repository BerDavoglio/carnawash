import 'package:flutter/material.dart';

import '../ui.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({super.key});

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
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
                        'Profile',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  notificationGeralButtonComponent(context),
                ],
              ),
              const SizedBox(height: 25),
              const Divider(),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Jorge Williams',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'jorgewilliams@gmail.com',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Divider(),
              const SizedBox(height: 25),
              profileButton(
                context,
                'My account Information',
                Icons.person,
              ),
              profileButton(
                context,
                'My Vehicles',
                Icons.directions_car,
              ),
              profileButton(
                context,
                'Wallet',
                Icons.credit_card,
              ),
              profileButton(
                context,
                'Language',
                Icons.more_horiz_outlined,
              ),
              profileButton(
                context,
                'Notification Settings',
                Icons.notifications_outlined,
              ),
              profileButton(
                context,
                'FAQ',
                Icons.thumb_up_outlined,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  'Terms and Conditions',
                  style: TextStyle(
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Logout',
                  style: TextStyle(
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox profileButton(
    BuildContext context,
    String text,
    IconData icon,
  ) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton.icon(
            style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(
                  Size(MediaQuery.of(context).size.width, 50),
                ),
                iconColor: MaterialStateProperty.all(Colors.black)),
            onPressed: () {},
            icon: Icon(icon),
            label: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                text,
                style: const TextStyle(color: Colors.black),
              ),
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
