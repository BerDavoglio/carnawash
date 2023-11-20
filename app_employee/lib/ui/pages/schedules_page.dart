// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../data/data.dart';
import '../../infra/infra.dart';
import '../ui.dart';

class SchedulesPage extends StatefulWidget {
  const SchedulesPage({super.key});

  @override
  State<SchedulesPage> createState() => _SchedulesPageState();
}

class _SchedulesPageState extends State<SchedulesPage> {
  DateTime today = DateTime.now();
  late ScheduleProvider scheduleProvider;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      scheduleProvider = Provider.of(
        context,
        listen: false,
      );

      scheduleProvider.loadSchedules(context, DateTime.now());
    });
  }

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() async {
      today = day;

      await scheduleProvider.loadSchedules(context, day);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100]!,
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
                  Column(
                    children: List.generate(
                      scheduleProvider.listSchedules.length,
                      (index) async {
                        return await scheduleBox(
                          context,
                          scheduleProvider.listSchedules[index],
                        );
                      } as Widget Function(int index),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<Container> scheduleBox(
    BuildContext context,
    ScheduleModel schedule,
  ) async {
    ScheduleProvider scheduleProvider = Provider.of(context, listen: false);
    VehiclesProvider vehiclesProvider = Provider.of(context, listen: false);
    ServicesProvider servicesProvider = Provider.of(context, listen: false);

    List<CarModel> carsList = [];
    List<CarObjectModel> carsObjectList = [];
    List<AdditionalModel> addonList = [];

    ClientModel? client =
        await scheduleProvider.loadClient(context, schedule.id!);

    for (var i in schedule.cars_list_id.split(';')) {
      CarObjectModel? car = await scheduleProvider.loadObjectCar(
        context,
        json.decode(i).id as int,
      );
      if (car != null) {
        carsObjectList.add(car);
      }
      for (var j in car!.additional_list_id.split(';')) {
        AdditionalModel? addon =
            servicesProvider.getAdditionalComplete(int.parse(j));
        addonList.add(addon!);
      }
    }
    for (var i in carsObjectList) {
      CarModel? car = await vehiclesProvider.loadOneCar(
        context,
        i.car_id,
      );
      if (car != null) {
        carsList.add(car);
      }
    }

    List status = [
      'Accept',
      const Color.fromRGBO(237, 189, 58, 1),
      'Reject',
    ];

    if (status[0] == 'accepted') {
      status = [
        'Accepted',
        Colors.grey,
        '',
      ];
    } else if (status[0] == 'start') {
      status = [
        'Start',
        Colors.green,
        '',
      ];
    } else if (status[0] == 'finish') {
      status = [
        'Finish',
        Colors.blue,
        '',
      ];
    }

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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Costumer: ${client!.name}',
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              DateFormat('yMMMMd')
                                  .format(schedule.selected_date)
                                  .toString(),
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              DateFormat('jm')
                                  .format(schedule.selected_date)
                                  .toString(),
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    TextButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                          const EdgeInsets.all(0),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WashRequestPage(
                              preData: schedule,
                            ),
                          ),
                        );
                      },
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
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              '${carsList[0].brand} - ${carsList[0].model} - ${servicesProvider.getCarsizeComplete(carsList[0].car_size_id).title}',
                              style: const TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                              )),
                          Text(carsList[0].plate,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                              )),
                          Row(
                            children: [
                              const Icon(
                                Icons.location_on_outlined,
                                size: 16,
                                color: Color.fromRGBO(237, 189, 58, 1),
                              ),
                              Text(
                                schedule.address,
                                style: const TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                          Row(
                            children: List.generate(
                              addonList.length,
                              (index) {
                                return Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: Text(
                                    '${addonList[index]}; ',
                                    style: const TextStyle(color: Colors.grey),
                                  ),
                                );
                              },
                            ),
                          ),
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
                  onPressed: () {},
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
                ? InkWell(
                    onTap: () {
                      // FAZER UMA VERIFICAÇÃO PARA DAR DECLINE
                      scheduleProvider.declineSchedule(context, schedule.id!);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text(
                        status[2],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
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
