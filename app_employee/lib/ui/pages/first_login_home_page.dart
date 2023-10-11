// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../ui.dart';

class FirstLoginHomePage extends StatefulWidget {
  const FirstLoginHomePage({super.key});

  @override
  State<FirstLoginHomePage> createState() => _FirstLoginHomePageState();
}

class _FirstLoginHomePageState extends State<FirstLoginHomePage> {
  int n = 1;
  int questionValue = 0;
  bool oneTrue = true;
  bool twoTrue = false;
  bool threeTrue = false;

  List questionList = [
    [
      '1. What are the products from Carnawash',
      [
        'Microfiber Cloths.',
        'Carnawash backpacker bag',
        'Carnawash Uniform',
        'All above',
      ],
      0,
    ],
    [
      '1. What are the products from Carnawash',
      [
        'Microfiber Cloths.',
        'Carnawash backpacker bag',
        'Carnawash Uniform',
        'All above',
      ],
      0,
    ],
    [
      '2. What are the products from Carnawash',
      [
        'Microfiber Cloths.',
        'Carnawash backpacker bag',
        'Carnawash Uniform',
        'All above',
      ],
      0,
    ],
    [
      '2. What are the products from Carnawash',
      [
        'Microfiber Cloths.',
        'Carnawash backpacker bag',
        'Carnawash Uniform',
        'All above',
      ],
      0,
    ],
    [
      '3. What are the products from Carnawash',
      [
        'Microfiber Cloths.',
        'Carnawash backpacker bag',
        'Carnawash Uniform',
        'All above',
      ],
      0,
    ],
    [
      '3. What are the products from Carnawash',
      [
        'Microfiber Cloths.',
        'Carnawash backpacker bag',
        'Carnawash Uniform',
        'All above',
      ],
      0,
    ],
    [
      '4. What are the products from Carnawash',
      [
        'Microfiber Cloths.',
        'Carnawash backpacker bag',
        'Carnawash Uniform',
        'All above',
      ],
      0,
    ],
    [
      '4. What are the products from Carnawash',
      [
        'Microfiber Cloths.',
        'Carnawash backpacker bag',
        'Carnawash Uniform',
        'All above',
      ],
      0,
    ],
    [
      '5. What are the products from Carnawash',
      [
        'Microfiber Cloths.',
        'Carnawash backpacker bag',
        'Carnawash Uniform',
        'All above',
      ],
      0,
    ],
  ];

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
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Column(
          children: [
            n == 1
                ? partOne(context)
                : n == 2
                    ? partTwo(context)
                    : n == 3
                        ? partThree(context)
                        : n == 4
                            ? partFour(context)
                            : n == 5
                                ? partFive(context)
                                : partSix(context),
            Padding(
              padding: const EdgeInsets.only(bottom: 5, left: 5, right: 5),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    fixedSize:
                        Size(MediaQuery.of(context).size.width * 0.85, 50)),
                onPressed: () {
                  if (n == 1) {
                    setState(() {
                      n = 2;
                    });
                  } else if (n == 2) {
                    setState(() {
                      n = 3;
                      oneTrue = false;
                      twoTrue = true;
                      threeTrue = false;
                    });
                  } else if (n == 3) {
                    setState(() {
                      if (questionValue + 1 < questionList.length / 4) {
                        questionValue++;
                      } else {
                        n = 4;
                        oneTrue = false;
                        twoTrue = false;
                        threeTrue = true;
                      }
                    });
                  } else if (n == 4) {
                    setState(() {
                      n = 5;
                      oneTrue = false;
                      twoTrue = false;
                      threeTrue = true;
                    });
                  } else if (n == 5) {
                    setState(() {
                      n = 6;
                    });
                  } else if (n == 6) {
                    setState(() {
                      Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomePage(validate: false),
              ),
            );
                    });
                  }
                },
                child: Text(n == 6
                    ? 'Go to Home'
                    : n == 5
                        ? 'Confirm'
                        : n == 4
                            ? 'Next Step'
                            : n == 1
                                ? 'Next'
                                : n == 2
                                    ? 'Go to Quiz'
                                    : (questionValue + 1 <
                                                questionList.length / 4 &&
                                            n == 3)
                                        ? 'Next'
                                        : 'Send your Answers'),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                "Logout",
                style: TextStyle(
                  color: Colors.amber,
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget partOne(BuildContext context) {
    return Column(
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
                          'Welcome, John!',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
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
        const SizedBox(height: 25),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.85,
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Thank you for applying to join the Carnawash team! You are only a few steps away from becoming your own boss, it's a great achievement!",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 15),
              Text(
                'Please find some easier and faster the following steps to start working with Carnawash!',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 15),
              Text(
                '1. Attended Carnawash Induction Day.',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 15),
              Text(
                "2. Watch our short video to complete our quiz assessment required by clicking on the bottom below Let's start.",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 15),
              Text(
                '3. Finalize the registration process by providing your information and confirming your availability to work.',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 15),
              Text(
                '4. You must also complete our CONTRACTOR INSURANCE APPLICATION FORM (Word format link here). *Once you complete it, please send it to admin@carnawashapp.com.',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 15),
              Text(
                'Carnawash will activate your profile to connect you to customers once you are ready to go to start working with our supervisors.',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 15),
              Text(
                'You will be able to access and receive our start-up pack from your app after you are approved by our supervisors to work independently.',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 15),
              Text(
                "If you have any queries, please don't hesitate to contact us at admin@carnawashapp.com or call 1300 807 389 (press 3 for Carnawash workers).",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 15),
              Text(
                'Good luck!',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'CARNAWASH TEAM',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget partTwo(BuildContext context) {
    return Center(
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
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.amber,
                          child: IconButton(
                            iconSize: 24,
                            color: Colors.white,
                            icon: const Icon(
                              Icons.arrow_back,
                            ),
                            onPressed: () {
                              setState(() {
                                n = 1;
                              });
                            },
                          ),
                        ),
                      ),
                      const Text(
                        'First Steps',
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
              const SizedBox(height: 15),
              Row(
                children: [
                  circularIndex('1', oneTrue),
                  circularIndex('2', twoTrue),
                  circularIndex('3', threeTrue),
                ],
              ),
              const SizedBox(height: 15),
              const Text(
                'Quiz',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 15),
              const Text('Watch the video and answer the quiz below'),
              const SizedBox(height: 15),
              InkWell(
                onTap: () {},
                child: const Text(
                  'Carnawash Video',
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.4),
            ],
          ),
        ),
      ),
    );
  }

  Widget circularIndex(String text, bool selected) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: selected ? Colors.blue : Colors.grey,
          borderRadius: const BorderRadius.all(
            Radius.circular(100),
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget partThree(BuildContext context) {
    return Center(
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
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.amber,
                          child: IconButton(
                            iconSize: 24,
                            color: Colors.white,
                            icon: const Icon(
                              Icons.arrow_back,
                            ),
                            onPressed: () {
                              setState(() {
                                if (questionValue == 0) {
                                  n = 2;
                                  oneTrue = true;
                                  twoTrue = false;
                                  threeTrue = false;
                                } else {
                                  questionValue--;
                                }
                              });
                            },
                          ),
                        ),
                      ),
                      const Text(
                        'First Steps',
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
              const SizedBox(height: 15),
              Row(
                children: [
                  circularIndex('1', oneTrue),
                  circularIndex('2', twoTrue),
                  circularIndex('3', threeTrue),
                ],
              ),
              const SizedBox(height: 15),
              const Text(
                'Questions',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  questionsMarker(
                    context,
                    true,
                  ),
                  questionsMarker(
                    context,
                    false,
                  ),
                  questionsMarker(
                    context,
                    false,
                  ),
                  questionsMarker(
                    context,
                    false,
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Column(
                children: List.generate(
                  chunk(questionList, 4)[questionValue].length,
                  (index) {
                    return questionBox(context,
                        chunk(questionList, 4)[questionValue][index], index);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<List<dynamic>> chunk(List<dynamic> array, int size) {
    List<List<dynamic>> chunks = [];
    int i = 0;
    while (i < array.length) {
      int j = i + size;
      chunks.add(array.sublist(i, j > array.length ? array.length : j));
      i = j;
    }
    return chunks;
  }

  Column questionBox(
    BuildContext context,
    List quest,
    int n,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          quest[0],
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: List.generate(
            quest[1].length,
            (index) {
              return ListTile(
                visualDensity: const VisualDensity(
                  horizontal: VisualDensity.minimumDensity,
                  vertical: VisualDensity.minimumDensity,
                ),
                title: Text(
                  quest[1][index],
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
                leading: Radio(
                  value: index,
                  groupValue: questionList[n][2],
                  fillColor: MaterialStateColor.resolveWith(
                    (states) => Colors.black,
                  ),
                  onChanged: (value) {
                    setState(() {
                      questionList[n][2] = value!;
                    });
                  },
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }

  Container questionsMarker(BuildContext context, bool val) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.2,
      height: 2,
      decoration: BoxDecoration(
        color: val ? Colors.amber : Colors.grey,
      ),
    );
  }

  Widget partFour(BuildContext context) {
    return Center(
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
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.amber,
                          child: IconButton(
                            iconSize: 24,
                            color: Colors.white,
                            icon: const Icon(
                              Icons.arrow_back,
                            ),
                            onPressed: () {
                              setState(() {
                                n = 3;
                                oneTrue = false;
                                twoTrue = true;
                                threeTrue = false;
                              });
                            },
                          ),
                        ),
                      ),
                      const Text(
                        'First Steps',
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
              const SizedBox(height: 15),
              Row(
                children: [
                  circularIndex('1', oneTrue),
                  circularIndex('2', twoTrue),
                  circularIndex('3', threeTrue),
                ],
              ),
              const SizedBox(height: 15),
              const Text(
                'Quiz',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 15),
              const Text('Congratulations!\nYou got 80% of the quiz right.'),
              SizedBox(height: MediaQuery.of(context).size.height * 0.45),
            ],
          ),
        ),
      ),
    );
  }

  Widget partFive(BuildContext context) {
    return Center(
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
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.amber,
                          child: IconButton(
                            iconSize: 24,
                            color: Colors.white,
                            icon: const Icon(
                              Icons.arrow_back,
                            ),
                            onPressed: () {
                              setState(() {
                                n = 4;
                                oneTrue = false;
                                twoTrue = true;
                                threeTrue = false;
                              });
                            },
                          ),
                        ),
                      ),
                      const Text(
                        'First Steps',
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
              const SizedBox(height: 15),
              const Text(
                'Set your current availability',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 15),
              faqBox(context, 0),
              faqBox(context, 1),
              faqBox(context, 2),
              faqBox(context, 3),
              faqBox(context, 4),
              faqBox(context, 5),
              faqBox(context, 6),
              const SizedBox(height: 15),
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
          width: MediaQuery.of(context).size.width * 0.85,
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

  Widget partSix(BuildContext context) {
    return Center(
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
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.amber,
                          child: IconButton(
                            iconSize: 24,
                            color: Colors.white,
                            icon: const Icon(
                              Icons.arrow_back,
                            ),
                            onPressed: () {
                              setState(() {
                                n = 4;
                                oneTrue = false;
                                twoTrue = true;
                                threeTrue = false;
                              });
                            },
                          ),
                        ),
                      ),
                      const Text(
                        'First Steps',
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
              const SizedBox(height: 15),
              Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.2,
                    ),
                    const Icon(
                      Icons.verified,
                      color: Colors.green,
                      size: 40,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Information Sent!',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Our team will update your details and will contact you shortly',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.2,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
