// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:app_employee/infra/infra.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../data/data.dart';
import '../ui.dart';

class PaymentsPage extends StatefulWidget {
  const PaymentsPage({super.key});

  @override
  State<PaymentsPage> createState() => _PaymentsPageState();
}

class _PaymentsPageState extends State<PaymentsPage> {
  TextEditingController initialDateController = TextEditingController();
  TextEditingController finalDateController = TextEditingController();
  double totalDay = 0;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      PaymentProvider paymentProvider = Provider.of(
        context,
        listen: false,
      );

      await paymentProvider.loadHistory(
          context, DateTime.now(), DateTime.now());
    });
  }

  @override
  Widget build(BuildContext context) {
    PaymentProvider paymentProvider = Provider.of(context);

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
                              iconSize:
                                  MediaQuery.of(context).size.width * 0.12,
                              onPressed: () async {
                                await paymentProvider.loadHistory(
                                  context,
                                  DateTime.parse(initialDateController.text),
                                  DateTime.parse(finalDateController.text),
                                );
                                setState(() {});
                              },
                              icon: const Icon(Icons.check_box),
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: List.generate(
                            paymentProvider.listPayment.length,
                            (indexPayment) async {
                              return await historyBoxComponent(
                                context,
                                paymentProvider.listPayment[indexPayment],
                                indexPayment,
                              );
                            } as Widget Function(int index)),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.all(16),
                        height: 93,
                        width: MediaQuery.of(context).size.width * 0.85,
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(229, 229, 229, 1),
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Total:',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              '\$ $totalDay',
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 24,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<Widget> historyBoxComponent(
    BuildContext context,
    PaymentModel payment,
    int index,
  ) async {
    ScheduleProvider scheduleProvider = Provider.of(context, listen: false);
    VehiclesProvider vehiclesProvider = Provider.of(context, listen: false);
    ServicesProvider servicesProvider = Provider.of(context, listen: false);

    List<CarModel?> carsList = [];
    List<CarObjectModel?> carsObjectList = [];
    List addonList = [];

    ScheduleModel? sched =
        await scheduleProvider.loadScheduleId(context, payment.wash_id);
    await servicesProvider.loadCarsize(context);

    ClientModel? client = await scheduleProvider.loadClient(
      context,
      sched!.id!,
    );

    for (var i in sched.cars_list_id.split(';')) {
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
        i!.car_id,
      );
      if (car != null) {
        carsList.add(car);
      }
    }
    double? price = await scheduleProvider.loadPrice(context, sched.id!);
    totalDay += price!;

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
                    Text(
                      'Client: ${client!.name}',
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          DateFormat('yMMMMd')
                              .format(sched.selected_date)
                              .toString(),
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          DateFormat('jm')
                              .format(sched.selected_date)
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
                      children: List.generate(
                        carsList.length,
                        (indexCar) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  child: Text(
                                    'Vehicle $indexCar',
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.grey,
                                  ),
                                  width:
                                      MediaQuery.of(context).size.width * 0.55,
                                  height: 1,
                                ),
                              ],
                            ),
                            Text(
                              '${carsList[indexCar]!.brand} - ${carsList[indexCar]!.model}',
                              style: const TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              carsList[indexCar]!.plate,
                              style: const TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              servicesProvider
                                  .getCarsizeComplete(
                                      carsList[indexCar]!.car_size_id)
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
                                      style:
                                          const TextStyle(color: Colors.grey),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '\$ $price',
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(height: 8),
                          payment.pay_data != null
                              ? Text(
                                  'Recivied in: ${payment.pay_data}',
                                  style: const TextStyle(
                                    color: Colors.grey,
                                  ),
                                )
                              : const Center(),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
