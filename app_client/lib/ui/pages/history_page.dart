// ignore_for_file: use_build_context_synchronously, must_be_immutable

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
    ScheduleProvider scheduleProvider = Provider.of(context, listen: false);

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
                            (index) {
                              return HistoryBoxComponent(
                                scheduleModel:
                                    scheduleProvider.listSchedules[index],
                              );
                            },
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
}

class HistoryBoxComponent extends StatefulWidget {
  late ScheduleModel scheduleModel;

  HistoryBoxComponent({
    super.key,
    required ScheduleModel scheduleModel,
  });

  @override
  State<HistoryBoxComponent> createState() => HistoryBoxComponentState();
}

class HistoryBoxComponentState extends State<HistoryBoxComponent> {
  List<CarModel?> carsList = [];
  List<CarObjectModel?> carsObjectList = [];
  List addonList = [];
  late double? price;
  late WasherModel? washer;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      ScheduleProvider scheduleProvider = Provider.of(context, listen: false);
      ServicesProvider servicesProvider = Provider.of(context, listen: false);
      VehiclesProvider vehiclesProvider = Provider.of(context, listen: false);

      await servicesProvider.loadCarsize(context);
      washer = await scheduleProvider.loadWasher(
        context,
        widget.scheduleModel.washer_id!,
      );

      for (var i in widget.scheduleModel.cars_list_id.split(';')) {
        CarObjectModel? car = await scheduleProvider.loadObjectCar(
          context,
          int.parse(i[0]),
        );
        if (car != null) {
          carsObjectList.add(car);
        }
        for (var j in car!.additional_list_id.split(';')) {
          AdditionalModel? addon =
              servicesProvider.getAdditionalComplete(int.parse(j));
          if (addon != null) {
            addonList.add(addon);
          }
        }
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
      price =
          await scheduleProvider.loadPrice(context, widget.scheduleModel.id!);
    });
  }

  @override
  Widget build(BuildContext context) {
    ServicesProvider servicesProvider = Provider.of(context, listen: false);

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
                            'Washer: ${washer!.name}',
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
                              .format(widget.scheduleModel.selected_date)
                              .toString(),
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          DateFormat('jm')
                              .format(widget.scheduleModel.selected_date)
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
