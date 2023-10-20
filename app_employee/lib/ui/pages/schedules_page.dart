import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../ui.dart';

class SchedulesPage extends StatefulWidget {
  const SchedulesPage({super.key});

  @override
  State<SchedulesPage> createState() => _SchedulesPageState();
}

class _SchedulesPageState extends State<SchedulesPage> {
  DateTime today = DateTime.now();
  List status = ['Accept', const Color.fromRGBO(237, 189, 58, 1), 'Reject'];

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: navigationBarComponent(context),
      backgroundColor: Colors.grey[100]!,
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          backButtonComponent(context),
                          const Text(
                            'My bookings',
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
                  const SizedBox(height: 16),
                  TableCalendar(
                    locale: 'pt_BR',
                    headerStyle: const HeaderStyle(
                      formatButtonVisible: false,
                      titleCentered: true,
                    ),
                    firstDay: DateTime.utc(2010, 1, 1),
                    lastDay: DateTime.utc(2030, 12, 31),
                    focusedDay: today,
                    selectedDayPredicate: (day) => isSameDay(day, today),
                    onDaySelected: _onDaySelected,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Booking date:',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 16),
                  scheduleBox(context),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container scheduleBox(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          right: 16,
          left: 16,
          bottom: 16,
          top: 8,
        ),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Costumer: Jorge',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          'September 10, 2023 - 10:00 am',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    TextButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                          const EdgeInsets.all(0),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'View',
                        style: TextStyle(
                          color: Colors.black,
                          decoration: TextDecoration.underline,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Nissan - March - Small',
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                              )),
                          Text('3SAM123',
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                              )),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                size: 16,
                                color: Color.fromRGBO(237, 189, 58, 1),
                              ),
                              Text(
                                'Monaco St, Bundall',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                          Text('+ Pet Small',
                              style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                    ],
                  ),
                ),
                TextButton(
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(5),
                    fixedSize: MaterialStateProperty.all<Size>(
                      Size(MediaQuery.of(context).size.width * 0.85, 50),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(
                      status[1],
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      if (status[0] == 'Accept') {
                        status = [
                          'Accepted',
                          Colors.grey,
                          'Cancel',
                        ];
                      } else if (status[0] == 'Accepted') {
                        status = [
                          'Start',
                          Colors.green,
                          'Cancel',
                        ];
                      } else if (status[0] == 'Start') {
                        status = [
                          'Finish',
                          Colors.blue,
                          '',
                        ];
                      } else if (status[0] == 'Finish') {
                        status = [
                          'Accept',
                          const Color.fromRGBO(237, 189, 58, 1),
                          'Reject',
                        ];
                      }
                    });
                  },
                  child: Text(
                    status[0],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            status[2] != ''
                ? Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text(
                      status[2],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
