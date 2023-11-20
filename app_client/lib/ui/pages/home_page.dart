// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../data/data.dart';
import '../../infra/infra.dart';
import '../ui.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController emailOneController = TextEditingController();
  TextEditingController emailTwoController = TextEditingController();
  TextEditingController emailThreeController = TextEditingController();
  ScheduleModel? scheduleOngoing;
  ScheduleModel? scheduleRebook;
  WasherModel? washer;
  double? priceRebook;
  List<CarModel> carsListRebook = [];
  List<CarObjectModel> carsObjectListRebook = [];
  List<AdditionalModel> addonListRebook = [];
  List<CarModel> carsListOngoing = [];
  List<CarObjectModel> carsObjectListOngoing = [];
  List<AdditionalModel> addonListOngoing = [];
  String sideOngoing = '';

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      VehiclesProvider vehiclesProvider = Provider.of(context, listen: false);
      ScheduleProvider scheduleProvider = Provider.of(context, listen: false);
      ServicesProvider servicesProvider = Provider.of(context, listen: false);

      scheduleRebook = await scheduleProvider.loadRebookSchedule(context);
      for (var i in scheduleRebook!.cars_list_id.split(';')) {
        CarObjectModel? car = await scheduleProvider.loadObjectCar(
          context,
          json.decode(i).id as int,
        );
        if (car != null) {
          carsObjectListRebook.add(car);
        }
        for (var j in json.decode(i).additional_list_id.split(';')) {
          AdditionalModel? addon = servicesProvider.getAdditionalComplete(j);
          if (addon != null) {
            addonListRebook.add(addon);
          }
        }
      }
      for (var i in carsObjectListRebook) {
        CarModel? car = await vehiclesProvider.loadOneCar(
          context,
          i.car_id,
        );
        if (car != null) {
          carsListRebook.add(car);
        }
      }
      priceRebook =
          await scheduleProvider.loadPrice(context, scheduleRebook!.id!);

      scheduleOngoing = await scheduleProvider.loadOngoingSchedule(context);
      washer = await scheduleProvider.loadWasher(context, scheduleOngoing!.id!);

      for (var i in scheduleOngoing!.cars_list_id.split(';')) {
        CarObjectModel? car = await scheduleProvider.loadObjectCar(
          context,
          json.decode(i).id as int,
        );
        if (car != null) {
          carsObjectListOngoing.add(car);
        }
        for (var j in json.decode(i).additional_list_id.split(';')) {
          AdditionalModel? addon = servicesProvider.getAdditionalComplete(j);
          if (addon != null) {
            addonListOngoing.add(addon);
          }
        }
        sideOngoing = json.decode(i).wash_type;
      }
      for (var i in carsObjectListOngoing) {
        CarModel? car = await vehiclesProvider.loadOneCar(
          context,
          i.car_id,
        );
        if (car != null) {
          carsListOngoing.add(car);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of(context, listen: false);

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
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          notificationHomeButtonComponent(context),
                          Text(
                            'Welcome, ${userProvider.perfil.name}!',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
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
                  const SizedBox(
                    height: 32,
                  ),
                  Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[100]!,
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Image(
                            alignment: Alignment.centerLeft,
                            image: AssetImage('images/car.png'),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.35,
                                  child: Column(
                                    children: [
                                      const Text(
                                        textAlign: TextAlign.center,
                                        'Get 10% off your next wash with the coupon.',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      TextButton(
                                        style: ButtonStyle(
                                          fixedSize:
                                              MaterialStateProperty.all<Size>(
                                            const Size(120, 30),
                                          ),
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                            Colors.white,
                                          ),
                                          shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(18.0),
                                            ),
                                          ),
                                        ),
                                        onPressed: () {},
                                        child: const Text(
                                          'CARNA10',
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.85,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Washing Process:',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        scheduleOngoing != null
                            ? ongoingScheduleBox(
                                context,
                                scheduleOngoing!,
                                carsListOngoing,
                                addonListOngoing,
                                sideOngoing,
                              )
                            : Container(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  TextButton(
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(5),
                      fixedSize: MaterialStateProperty.all<Size>(
                        Size(MediaQuery.of(context).size.width * 0.85, 50),
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromRGBO(237, 189, 58, 1),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SchedulePage(initial: 1),
                        ),
                      );
                    },
                    child: const Text(
                      'Make a new Booking',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(5),
                      fixedSize: MaterialStateProperty.all<Size>(
                        Size(MediaQuery.of(context).size.width * 0.85, 50),
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromRGBO(237, 189, 58, 1),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed(AppRoutes.SUBSCRIPTION);
                    },
                    child: const Text(
                      'Subscribe',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.85,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Your last Wash:',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        scheduleRebook != null
                            ? rebookScheduleBox(
                                context,
                                scheduleRebook!,
                                carsListRebook,
                                carsObjectListRebook,
                                addonListRebook,
                                priceRebook!,
                              )
                            : Container(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.85,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Refer to my Friends!',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const Text(
                          'Sharing is caring! Refer 3 friends and you and your friends win a 10% discount on your next wash!',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        geralTextInput(
                          context: context,
                          text: 'E-mail or Phone Number',
                          textController: emailOneController,
                        ),
                        geralTextInput(
                          context: context,
                          text: 'E-mail or Phone Number',
                          textController: emailTwoController,
                        ),
                        geralTextInput(
                          context: context,
                          text: 'E-mail or Phone Number',
                          textController: emailThreeController,
                        ),
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(
                                width: 2,
                                color: Color.fromRGBO(237, 189, 58, 1)),
                            elevation: 5,
                            fixedSize: Size(
                                MediaQuery.of(context).size.width * 0.85, 50),
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () async {
                            await userProvider.referFriends(
                              context,
                              '${emailOneController.text};${emailTwoController.text};${emailThreeController.text};',
                            );
                          },
                          child: const Text(
                            'Send for us',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(237, 189, 58, 1),
                            ),
                          ),
                        ),
                      ],
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

  Container rebookScheduleBox(
    BuildContext context,
    ScheduleModel select,
    List<CarModel> carsList,
    List<CarObjectModel> carsObjectList,
    List addonList,
    double price,
  ) {
    ServicesProvider servicesProvider = Provider.of(context, listen: false);

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      width: MediaQuery.of(context).size.width * 0.85,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${carsList[0].brand} ${carsList[0].model}',
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                TextButton(
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
                    'Book Again',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                'Wash ${servicesProvider.getCarsizeComplete(carsList[0].car_size_id).title}',
                style: const TextStyle(color: Colors.grey),
              ),
            ),
            Column(
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
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                '\$ $price',
                style: const TextStyle(color: Colors.grey),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Row(
                children: [
                  const Icon(
                    Icons.location_on_outlined,
                    color: Color.fromRGBO(237, 189, 58, 1),
                    size: 16,
                  ),
                  Text(
                    select.address,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            Center(
              child: TextButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RatingPage(id: select.id!),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.star_outline,
                  size: 20,
                ),
                label: const Text(
                  'Rate our service!',
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container ongoingScheduleBox(
    BuildContext context,
    ScheduleModel select,
    List carsList,
    List addonList,
    String side,
  ) {
    ServicesProvider servicesProvider = Provider.of(context, listen: false);

    List status = [
      Colors.grey,
      'Not Started',
    ];

    if (select.status == 'finished') {
      status = [
        Colors.grey,
        'Not Started',
      ];
    } else if (select.status == 'not-started') {
      status = [
        Colors.blue,
        'Started',
      ];
    } else if (select.status == 'started') {
      status = [
        Colors.green,
        'Finished',
      ];
    }

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      width: MediaQuery.of(context).size.width * 0.85,
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              DateFormat('yMMMMd').format(select.selected_date).toString(),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Washer: ${washer!.name}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      washer!.rate.toString(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Icon(
                      Icons.star,
                      size: 20,
                      color: Color.fromRGBO(237, 189, 58, 1),
                    ),
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        '${carsList[0]!.brand} - ${carsList[0]!.model} - ${servicesProvider.getCarsizeComplete(carsList[0].car_size_id).title}',
                        style: const TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        carsList[0]!.plate,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        'Wash $side',
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ),
                    Column(
                      children: List.generate(
                        addonList.length,
                        (index) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Text(
                              '+ ${addonList[index]}',
                              style: const TextStyle(color: Colors.grey),
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.location_on_outlined,
                            color: Color.fromRGBO(237, 189, 58, 1),
                            size: 16,
                          ),
                          Text(
                            select.address,
                            style: const TextStyle(color: Colors.grey),
                          ),
                        ],
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
            status[1] == 'Finished'
                ? Center(
                    child: TextButton.icon(
                      onPressed: () {
                        MaterialPageRoute(
                          builder: (context) => RatingPage(id: select.id!),
                        );
                      },
                      icon: const Icon(
                        Icons.star_outline,
                        size: 20,
                      ),
                      label: const Text(
                        'Rate our service!',
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  )
                : const Center(),
          ],
        ),
      ),
    );
  }
}
