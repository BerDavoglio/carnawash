import 'package:flutter/material.dart';

import '../ui.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class WashSelectionModel {
  WashSelectionModel({
    required this.date,
    required this.washer,
    required this.car,
    required this.side,
    required this.additional,
    required this.address,
    required this.status,
    required this.price,
  });

  String date;
  WasherModel washer;
  CarModel car;
  String side;
  List additional;
  String address;
  String status;
  double price;
}

class WasherModel {
  WasherModel({
    required this.name,
    required this.rate,
  });

  String name;
  double rate;
}

class CarModel {
  CarModel({
    required this.brand,
    required this.model,
    required this.size,
    required this.licence,
  });

  String brand;
  String model;
  String size;
  String licence;
}

class _HomePageState extends State<HomePage> {
  TextEditingController emailOneController = TextEditingController();
  TextEditingController emailTwoController = TextEditingController();
  TextEditingController emailThreeController = TextEditingController();

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
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          notificationHomeButtonComponent(context),
                          const Text(
                            'Welcome, Jorge!',
                            style: TextStyle(
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
                    height: 10,
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
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image(
                            width: MediaQuery.of(context).size.width * 0.45,
                            image: const AssetImage('images/car.png'),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.385,
                                  child: Column(
                                    children: [
                                      const Text(
                                        textAlign: TextAlign.center,
                                        'Get 10% off your next wash with the coupon.',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
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
                  const SizedBox(height: 30),
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
                        const SizedBox(height: 5),
                        washingProcessBox(
                          context,
                          WashSelectionModel(
                              date: 'September 10, 2023 - 10:00PM',
                              washer: WasherModel(
                                name: 'John',
                                rate: 4.6,
                              ),
                              car: CarModel(
                                brand: 'Nissan',
                                model: 'March',
                                size: 'Small',
                                licence: '3SAM123',
                              ),
                              side: 'Outside Only',
                              additional: [
                                'Pet Hair',
                              ],
                              address: 'Monaco St, Bundall',
                              status: 'Started',
                              price: 95.00),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  TextButton(
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(5),
                      fixedSize: MaterialStateProperty.all<Size>(
                        Size(MediaQuery.of(context).size.width * 0.85, 50),
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
                  const SizedBox(height: 10),
                  TextButton(
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(5),
                      fixedSize: MaterialStateProperty.all<Size>(
                        Size(MediaQuery.of(context).size.width * 0.85, 50),
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
                      'Subscribe',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
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
                        const SizedBox(height: 5),
                        lastWashBox(
                          context,
                          WashSelectionModel(
                            date: 'September 10, 2023 - 10:00PM',
                            washer: WasherModel(
                              name: 'John',
                              rate: 4.6,
                            ),
                            car: CarModel(
                              brand: 'Nissan',
                              model: 'March',
                              size: 'Small',
                              licence: '3SAM123',
                            ),
                            side: 'Outside Only',
                            additional: [
                              'Pet Hair',
                            ],
                            address: 'Monaco St, Bundall',
                            status: 'Started',
                            price: 95.00,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
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
                          height: 10,
                        ),
                        const Text(
                          'Sharing is caring! Refer 3 friends and you and your friends win a 10% discount on your next wash!',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
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
                            side:
                                const BorderSide(width: 2, color: Colors.amber),
                            elevation: 5,
                            fixedSize: Size(
                                MediaQuery.of(context).size.width * 0.85, 50),
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {},
                          child: const Text(
                            'Send for us',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.amber,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container lastWashBox(
    BuildContext context,
    WashSelectionModel obj,
  ) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      width: MediaQuery.of(context).size.width * 0.85,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${obj.car.brand} ${obj.car.model}',
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SchedulePage(initial: 3),
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
              padding: const EdgeInsets.only(top: 5),
              child: Text(
                'Wash ${obj.side}',
                style: const TextStyle(color: Colors.grey),
              ),
            ),
            Column(
              children: List.generate(
                obj.additional.length,
                (index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                      '+ ${obj.additional[index]}',
                      style: const TextStyle(color: Colors.grey),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(
                '\$ ${obj.price}',
                style: const TextStyle(color: Colors.grey),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Row(
                children: [
                  const Icon(
                    Icons.location_on_outlined,
                    color: Colors.amber,
                  ),
                  Text(
                    obj.address,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            Center(
              child: TextButton.icon(
                onPressed: () {
                  Navigator.of(context).pushNamed(AppRoutes.RATING);
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

  Container washingProcessBox(
    BuildContext context,
    WashSelectionModel obj,
  ) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      width: MediaQuery.of(context).size.width * 0.85,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              obj.date,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Washer: ${obj.washer.name}',
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      obj.washer.rate.toString(),
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const Icon(
                      Icons.star,
                      size: 20,
                      color: Colors.amber,
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
                        '${obj.car.brand} ${obj.car.model} - ${obj.car.size}',
                        style: const TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        obj.car.licence,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        'Wash ${obj.side}',
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ),
                    Column(
                      children: List.generate(
                        obj.additional.length,
                        (index) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Text(
                              '+ ${obj.additional[index]}',
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
                            color: Colors.amber,
                          ),
                          Text(
                            obj.address,
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
                    border: Border.all(color: Colors.blueAccent),
                  ),
                  child: Center(
                    child: Text(
                      obj.status,
                      style: const TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
