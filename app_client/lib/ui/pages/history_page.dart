// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../data/data.dart';
import '../../infra/infra.dart';
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
    ScheduleProvider scheduleProvider = Provider.of(context);

    return Scaffold(
      backgroundColor: Colors.grey[100],
      bottomNavigationBar: navigationBarComponent(context),
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.85,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 50,
              ),
              child: Center(
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Filter the date',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            geralDateInput(
                              context: context,
                              text: 'Date',
                              textController: initialDateController,
                            ),
                            geralDateInput(
                              context: context,
                              text: 'End Date',
                              textController: finalDateController,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: IconButton(
                                padding: const EdgeInsets.all(0),
                                color: Colors.blue,
                                iconSize: 55,
                                onPressed: () async {
                                  await scheduleProvider.loadHistory(
                                    context,
                                    DateTime.parse(initialDateController.text),
                                    DateTime.parse(finalDateController.text),
                                  );
                                },
                                icon: const Icon(Icons.check_box),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: List.generate(
                            scheduleProvider.listSchedules.length,
                            (index) async {
                              return await historyBoxComponent(
                                context,
                                scheduleProvider,
                                index,
                              );
                            } as Widget Function(int index),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<Widget> historyBoxComponent(
    BuildContext context,
    ScheduleProvider schedule,
    int index,
  ) async {
    VehiclesProvider vehiclesProvider = Provider.of(context);
    ServicesProvider servicesProvider = Provider.of(context);

    List<CarModel?> carsList = [];
    List<CarObjectModel?> carsObjectList = [];
    List addonList = [];

    await servicesProvider.loadCarsize(context);

    WasherModel? washer = await schedule.loadWasher(
      context,
      schedule.listHistorySchedules[index].id!,
    );
    for (var i
        in schedule.listHistorySchedules[index].cars_list_id.split(';')) {
      CarObjectModel? car = await schedule.loadObjectCar(
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
        i!.car_id,
      );
      if (car != null) {
        carsList.add(car);
      }
    }
    double? price = await schedule.loadPrice(context, index);

    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    washer != null
                        ? Text(
                            'Washer: ${washer.name}',
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          )
                        : const Text(
                            'Washer: Not Assigned!',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          DateFormat('yMMMMd')
                              .format(
                                  schedule.listSchedules[index].selected_date)
                              .toString(),
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          DateFormat('jm')
                              .format(
                                  schedule.listSchedules[index].selected_date)
                              .toString(),
                          style: const TextStyle(
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
                          '${carsList[0]!.brand} - ${carsList[0]!.model}',
                          style: const TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          carsList[0]!.plate,
                          style: const TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          servicesProvider
                              .getCarsizeComplete(carsList[0]!.car_size_id)
                              .title,
                          style: const TextStyle(
                            color: Colors.grey,
                          ),
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
                    Text(
                      '\$ ${price?.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
