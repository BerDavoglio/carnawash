import 'package:flutter/material.dart';

import '../ui.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  int sizeSelected = 1;
  int n = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: navigationBarComponent(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 50,
            horizontal: 25,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
                        'Schedule',
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
              const SizedBox(height: 15),
              n == 1 ? firstPart(context) : secondPart(context),
              const SizedBox(height: 15),
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
                  'Next',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column firstPart(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Choose your car to be washed',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Schedule up to 3 cars at once. For schedule more than than 3 cars, contact support through our chat.',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ListTile(
                    title: const Text(
                      'Nissan March - SMALL',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: const Text(
                      'Red; 3SAM123',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    leading: Radio(
                      value: 1,
                      groupValue: sizeSelected,
                      fillColor: MaterialStateColor.resolveWith(
                        (states) => Colors.black,
                      ),
                      onChanged: (value) {
                        setState(() {
                          sizeSelected = value!;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ListTile(
                    title: const Text(
                      'Nissan March - SMALL',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: const Text(
                      'Red; 3SAM122',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    leading: Radio(
                      value: 2,
                      groupValue: sizeSelected,
                      fillColor: MaterialStateColor.resolveWith(
                        (states) => Colors.black,
                      ),
                      onChanged: (value) {
                        setState(() {
                          sizeSelected = value!;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ListTile(
                    title: const Text(
                      'Nissan Kicks - 2DV SUVs',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: const Text(
                      'Red; 3SAM126',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    leading: Radio(
                      value: 3,
                      groupValue: sizeSelected,
                      fillColor: MaterialStateColor.resolveWith(
                        (states) => Colors.black,
                      ),
                      onChanged: (value) {
                        setState(() {
                          sizeSelected = value!;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const Text(
          'Choose another car to be washed',
          style: TextStyle(color: Colors.amber, fontSize: 18),
        ),
      ],
    );
  }

  Column secondPart(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [],
          ),
        ),
      ],
    );
  }
}
