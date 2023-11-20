// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
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

      scheduleProvider.loadDate(context, DateTime.now());
    });
  }

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() async {
      today = day;

      await scheduleProvider.loadDate(context, day);
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
                            'My appointments',
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
                      scheduleProvider.listByDate.length,
                      (index) async {
                        return await scheduleBox(
                          context,
                          scheduleProvider.listByDate[index],
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
    VehiclesProvider vehiclesProvider = Provider.of(context, listen: false);
    ScheduleProvider scheduleProvider = Provider.of(context, listen: false);
    ServicesProvider servicesProvider = Provider.of(context, listen: false);

    List<CarModel> carsList = [];
    List<CarObjectModel> carsObjectList = [];
    List<AdditionalModel> addonList = [];

    WasherModel? washer =
        await scheduleProvider.loadWasher(context, schedule.id!);

    for (var i in schedule.cars_list_id.split(';')) {
      CarObjectModel? car = await scheduleProvider.loadObjectCar(
        context,
        json.decode(i).id as int,
      );
      if (car != null) {
        carsObjectList.add(car);
      }
      addonList = json.decode(i).additional_list_id;
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
      Colors.grey,
      'Not Started',
    ];

    if (schedule.status == 'finished') {
      status = [
        Colors.grey,
        'Not Started',
      ];
    } else if (schedule.status == 'not-started') {
      status = [
        Colors.blue,
        'Started',
      ];
    } else if (schedule.status == 'started') {
      status = [
        Colors.green,
        'Finished',
      ];
    }

    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DateFormat('yMMMMd h:mm a')
                      .format(schedule.selected_date)
                      .toString(),
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                washer != null
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Washer: ${washer.name}',
                            style: const TextStyle(fontWeight: FontWeight.w500),
                          ),
                          RatingBarIndicator(
                            rating: washer.rate,
                            itemBuilder: (context, index) => const Icon(
                              Icons.star,
                              color: Color.fromRGBO(237, 189, 58, 1),
                            ),
                            itemCount: 5,
                            itemSize: 20,
                            direction: Axis.horizontal,
                          ),
                        ],
                      )
                    : const Text(
                        'Washer: Not Assigned!',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${carsList[0].brand} - ${carsList[0].model}',
                              style: const TextStyle(color: Colors.grey)),
                          Text(carsList[0].plate,
                              style: const TextStyle(color: Colors.grey)),
                          Text(schedule.address,
                              style: const TextStyle(color: Colors.grey)),
                          Text(
                              servicesProvider
                                  .getCarsizeComplete(carsList[0].car_size_id)
                                  .title,
                              style: const TextStyle(color: Colors.grey)),
                          Row(
                            children: List.generate(
                              addonList.length,
                              (index) {
                                return Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: Text(
                                    '+ ${addonList[index]}',
                                    style: const TextStyle(color: Colors.grey),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 100,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(100),
                          ),
                          border: Border.all(color: status[0]),
                        ),
                        child: Center(
                          child: Text(
                            status[1],
                            style: TextStyle(
                              color: status[0],
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                schedule.status == 'finished'
                    ? TextButton(
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all(5),
                          fixedSize: MaterialStateProperty.all<Size>(
                            Size(MediaQuery.of(context).size.width * 0.85, 50),
                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromRGBO(237, 189, 58, 1),
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SchedulePage(
                                initial: 3,
                                preData: carsObjectList,
                              ),
                            ),
                          );
                        },
                        child: const Text(
                          'Reschedule',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      )
                    : const Center(),
              ],
            ),
            DateTime.now().difference(schedule.selected_date).inHours > 2
                ? Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: InkWell(
                      onTap: () {
                        showDialog<void>(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            title: const Text('Cancel confirmation'),
                            content: const Text(
                                'Are you sure that you want to cancel this wash?'),
                            actions: [
                              TextButton(
                                child: const Text('Yes'),
                                onPressed: () async {
                                  await scheduleProvider.cancelSchedule(
                                      context, schedule.id!);
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          ),
                        );
                      },
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                : const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
