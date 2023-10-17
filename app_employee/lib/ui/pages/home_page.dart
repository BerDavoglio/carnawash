import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../ui.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    this.validate = true,
  }) : super(key: key);

  final bool validate;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      bottomNavigationBar: widget.validate
          ? navigationBarComponent(context)
          : TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed(AppRoutes.LOGIN);
              },
              child:
                  const Text('Logout', style: TextStyle(color: Colors.amber)),
            ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: const BoxDecoration(color: Colors.white),
              child: Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 50,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            notificationHomeButtonComponent(context),
                            const Text(
                              'Welcome, Jorge!',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const Image(
                          width: 125,
                          image: AssetImage('images/logo.png'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            widget.validate ? validatedTrue(context) : validatedFalse(context),
          ],
        ),
      ),
    );
  }

  Widget validatedTrue(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 25,
        right: 25,
        bottom: 25,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 32),
          const Text(
            'Your rate',
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 16),
          RatingBarIndicator(
            rating: 2.75,
            itemBuilder: (context, index) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            itemCount: 5,
            itemSize: 40,
            direction: Axis.horizontal,
          ),
          const SizedBox(height: 24),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.85,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                color: Colors.white,
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Column(children: [
                  Text(
                    'Number of Washes',
                    style: TextStyle(fontSize: 14),
                  ),
                  Text(
                    '15',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 28,
                    ),
                  ),
                ]),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  color: Colors.white,
                ),
                width: MediaQuery.of(context).size.width * 0.42,
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Column(children: [
                    Text(
                      'Next scheduled',
                      style: TextStyle(fontSize: 14),
                    ),
                    Text(
                      '3',
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 28,
                      ),
                    ),
                  ]),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  color: Colors.white,
                ),
                width: MediaQuery.of(context).size.width * 0.42,
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Column(children: [
                    Text(
                      'Canceled washes',
                      style: TextStyle(fontSize: 14),
                    ),
                    Text(
                      '2',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 28,
                      ),
                    ),
                  ]),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(24),
            height: 72,
            width: MediaQuery.of(context).size.width * 0.85,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(229, 229, 229, 1),
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            child: const Row(
              children: [
                Icon(Icons.report_outlined),
                Text(
                  'You have a wash request',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.85,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Washing Process:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'September 10, 2023 - 10PM',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                        const Text(
                          'Costumer: Jorge',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 8),
                              child: Text(
                                'Nissan March - Small',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: Text(
                                '3SAM123',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: Text(
                                'Wash Outside only',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: Text(
                                '+ Pet Hair',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.location_on_outlined,
                                    color: Colors.amber,
                                  ),
                                  Text(
                                    'Monaco St, Bundall',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        TextButton(
                          style: ButtonStyle(
                            elevation: MaterialStateProperty.all(5),
                            fixedSize: MaterialStateProperty.all<Size>(
                              Size(
                                MediaQuery.of(context).size.width * 0.85,
                                50,
                              ),
                            ),
                            backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.green,
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
                            'Start',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Center(
                          child: TextButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed(AppRoutes.WASH_REQUEST);
                            },
                            child: const Text(
                              'View more information',
                              style: TextStyle(
                                color: Colors.amber,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget validatedFalse(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 25,
        right: 25,
        bottom: 25,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              children: [
                Icon(Icons.circle, color: Colors.blue[600]!, size: 30),
                const SizedBox(width: 10),
                const Text('Your information is processing',
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
              ],
            ),
          ),
          const Text('We have recivied you information.'),
          const SizedBox(height: 10),
          const Text(
              'You will receive a notification via the app once you access is activate'),
        ],
      ),
    );
  }
}
