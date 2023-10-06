import 'package:flutter/material.dart';

import '../ui.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  TextEditingController initialDateController = TextEditingController();
  TextEditingController finalDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
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
                        'History',
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
              const SizedBox(height: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Filter the date',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          geralDateInput(
                            context: context,
                            text: 'Date',
                            textController: initialDateController,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.01,
                          ),
                          geralDateInput(
                            context: context,
                            text: 'End Date',
                            textController: finalDateController,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: IconButton(
                          padding: const EdgeInsets.all(0),
                          color: Colors.blue,
                          style: ButtonStyle(
                            fixedSize: MaterialStateProperty.all(
                              Size(MediaQuery.of(context).size.width * 0.12,
                                  MediaQuery.of(context).size.width * 0.12),
                            ),
                          ),
                          iconSize: MediaQuery.of(context).size.width * 0.12,
                          onPressed: () {},
                          icon: const Icon(Icons.check_box),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      historyBoxComponent(),
                      historyBoxComponent(),
                      historyBoxComponent(),
                      historyBoxComponent(),
                      historyBoxComponent(),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget historyBoxComponent() {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Washer: John',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'September 10, 2023',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          '10:00 am',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Nissan - March',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          '3SAM123',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          'Small',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          '+ Pet Hair',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '\$ 94.00',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ],
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
