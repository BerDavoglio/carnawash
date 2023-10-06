// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../ui.dart';

class AvailabilityPage extends StatefulWidget {
  const AvailabilityPage({super.key});

  @override
  State<AvailabilityPage> createState() => _AvailabilityPageState();
}

class Item {
  Item({
    required this.day,
    required this.start,
    required this.finish,
    required this.breakpoint,
    required this.pause,
    this.isOpen = false,
  });

  String day;
  TimeOfDay start;
  TimeOfDay finish;
  TimeOfDay breakpoint;
  TimeOfDay pause;
  bool isOpen;
}

class _AvailabilityPageState extends State<AvailabilityPage> {
  void _selectTime(oldTime) async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: oldTime,
      initialEntryMode: TimePickerEntryMode.input,
    );
    if (newTime != null) {
      setState(() {
        oldTime = newTime;
      });
    }
  }

  List<Item> list = [
    Item(
      day: 'Monday',
      start: TimeOfDay(hour: 9, minute: 30),
      finish: TimeOfDay(hour: 16, minute: 30),
      pause: TimeOfDay(hour: 10, minute: 00),
      breakpoint: TimeOfDay(hour: 11, minute: 00),
      isOpen: false,
    ),
    Item(
      day: 'Tuesday',
      start: TimeOfDay(hour: 10, minute: 30),
      finish: TimeOfDay(hour: 16, minute: 30),
      pause: TimeOfDay(hour: 10, minute: 00),
      breakpoint: TimeOfDay(hour: 11, minute: 00),
      isOpen: false,
    ),
    Item(
      day: 'Wednesday',
      start: TimeOfDay(hour: 9, minute: 30),
      finish: TimeOfDay(hour: 16, minute: 30),
      pause: TimeOfDay(hour: 10, minute: 00),
      breakpoint: TimeOfDay(hour: 11, minute: 00),
      isOpen: false,
    ),
    Item(
      day: 'Thursday',
      start: TimeOfDay(hour: 9, minute: 30),
      finish: TimeOfDay(hour: 16, minute: 30),
      pause: TimeOfDay(hour: 10, minute: 00),
      breakpoint: TimeOfDay(hour: 11, minute: 00),
      isOpen: false,
    ),
    Item(
      day: 'Friday',
      start: TimeOfDay(hour: 9, minute: 30),
      finish: TimeOfDay(hour: 16, minute: 30),
      pause: TimeOfDay(hour: 10, minute: 00),
      breakpoint: TimeOfDay(hour: 11, minute: 00),
      isOpen: false,
    ),
    Item(
      day: 'Saturday',
      start: TimeOfDay(hour: 9, minute: 30),
      finish: TimeOfDay(hour: 16, minute: 30),
      pause: TimeOfDay(hour: 10, minute: 00),
      breakpoint: TimeOfDay(hour: 11, minute: 00),
      isOpen: false,
    ),
    Item(
      day: 'Sunday',
      start: TimeOfDay(hour: 9, minute: 30),
      finish: TimeOfDay(hour: 16, minute: 30),
      pause: TimeOfDay(hour: 10, minute: 00),
      breakpoint: TimeOfDay(hour: 11, minute: 00),
      isOpen: false,
    ),
  ];

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
                        'Availability',
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
                  Text(
                    'Set your working hours',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  faqBox(context, 0),
                  faqBox(context, 1),
                  faqBox(context, 2),
                  faqBox(context, 3),
                  faqBox(context, 4),
                  faqBox(context, 5),
                  faqBox(context, 6),
                  SizedBox(height: 20),
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
                    child: const Text(
                      'Confirm',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {},
                  ),
                  SizedBox(height: 5),
                  Center(
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Log out',
                        style: TextStyle(
                          color: Colors.amber,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget faqBox(
    BuildContext context,
    int index,
  ) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
            color: Colors.amber[300]!,
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.all(
                        Radius.circular(100),
                      ),
                      color: Colors.white),
                ),
                Text(
                  list[index].day,
                ),
                IconButton(
                  splashColor: Colors.white,
                  splashRadius: 10,
                  icon: Icon(!list[index].isOpen
                      ? Icons.keyboard_arrow_down
                      : Icons.keyboard_arrow_down),
                  onPressed: () {
                    setState(() {
                      list[index].isOpen = !list[index].isOpen;
                    });
                  },
                )
              ],
            ),
          ),
        ),
        list[index].isOpen
            ? Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Start Time'),
                          GestureDetector(
                            onTap: () {
                              _selectTime(list[index].start);
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.75,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(5),
                                ),
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(7),
                                child: Text(
                                  '${list[index].start.hour}:${list[index].start.minute}',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Finish Time'),
                          GestureDetector(
                            onTap: () {
                              _selectTime(list[index].finish);
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.75,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(5),
                                ),
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(7),
                                child: Text(
                                  '${list[index].finish.hour}:${list[index].finish.minute}',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 10,
                        left: 20,
                        right: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Break Time'),
                              GestureDetector(
                                onTap: () {
                                  _selectTime(list[index].breakpoint);
                                },
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.35,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(5),
                                    ),
                                    border: Border.all(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(7),
                                    child: Text(
                                      '${list[index].breakpoint.hour}:${list[index].breakpoint.minute}',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Pause Time'),
                              GestureDetector(
                                onTap: () {
                                  _selectTime(list[index].pause);
                                },
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.35,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(5),
                                    ),
                                    border: Border.all(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(7),
                                    child: Text(
                                      '${list[index].pause.hour}:${list[index].pause.minute}',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            : const SizedBox(),
        const SizedBox(height: 10),
      ],
    );
  }
}
