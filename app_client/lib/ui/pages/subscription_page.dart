import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../data/data.dart';
import '../../infra/infra.dart';
import '../ui.dart';

class SubscriptionPage extends StatefulWidget {
  const SubscriptionPage({super.key});

  @override
  State<SubscriptionPage> createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<SubscriptionPage> {
  int n = 1;
  DateTime today = DateTime.now();

  List<String> listDelay = ['7 days', '15 days', '30 days'];
  String? delaySelected;

  @override
  void initState() {
    super.initState();

    delaySelected = listDelay[0];

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      RegularwashProvider regularWashProvider = Provider.of(context);

      regularWashProvider.loadRegular(context);
    });
  }

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                mainAxisAlignment: MainAxisAlignment.center,
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
                              backgroundColor:
                                  const Color.fromRGBO(237, 189, 58, 1),
                              child: IconButton(
                                iconSize: 24,
                                color: Colors.white,
                                icon: const Icon(
                                  Icons.arrow_back,
                                ),
                                onPressed: () {
                                  if (n == 1) {
                                    Navigator.of(context).pop();
                                  } else if (n == 2) {
                                    setState(() {
                                      n = 1;
                                    });
                                  } else if (n == 3) {
                                    Navigator.of(context)
                                        .pushReplacementNamed(AppRoutes.HOME);
                                  }
                                },
                              ),
                            ),
                          ),
                          const Text(
                            'Shedule Regular Wash',
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
                  const SizedBox(height: 32),
                  n == 1
                      ? partOne(context)
                      : n == 2
                          ? secondPart(context)
                          : thirdPart(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Column partOne(BuildContext context) {
    RegularwashProvider regularWashProvider = Provider.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'With regular washes you can save up to 20%!',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 20),
        RichText(
          textAlign: TextAlign.left,
          text: const TextSpan(
            children: [
              TextSpan(
                text:
                    'Your washing will be apointed automatically every day and hour of the week that you request, starting with ',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
                ),
              ),
              TextSpan(
                text: '15 days',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              TextSpan(
                text: ' at a maximum period of ',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
                ),
              ),
              TextSpan(
                text: '1 month',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              TextSpan(
                text: '.',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'Check our regular wash prices:',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 20),
        Column(
          children: List.generate(
            regularWashProvider.regularWashList.length,
            (index) => subscriptionBox(
              SubscriptionBoxModel(
                car_size: regularWashProvider.regularWashList[index].car_size,
                price: regularWashProvider.regularWashList[index].price,
                additional_services: regularWashProvider
                    .regularWashList[index].additional_services,
              ),
            ),
          ),
        ),
        const SizedBox(height: 13),
        const Text(
          "After you request regular wash don't worry! We will remind you to schedule your washes before the time expires and you lose your discount.",
          style: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 14,
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
            setState(() {
              n = 2;
            });
          },
          child: const Text(
            'Start your regular wash',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'Rescheduled or cancelled regular washes out of the time appointed will not be eligible for the discount.',
          style: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 14,
            color: Color.fromRGBO(122, 122, 122, 1),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget subscriptionBox(
    SubscriptionBoxModel obj,
  ) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    obj.car_size,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    obj.price,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              const Text(
                'Inside and outside wash',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 14),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Pet Hair',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '\$15,00',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Extra Dirt',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '\$20,00',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Extra Heavy Dirt',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '\$40,00',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 7),
      ],
    );
  }

  Column secondPart(BuildContext context) {
    UserProvider userProvider = Provider.of(context, listen: false);

    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.85,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Choose your starting the day',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "We will remind you 24 hours before your date appointed here, don't worry!",
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 20),
              const Center(
                child: Text(
                  "Every",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: Container(
                  width: 140,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey[700]!),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: DropdownButton(
                    isExpanded: true,
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    value: delaySelected,
                    items: listDelay
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(item),
                            ))
                        .toList(),
                    onChanged: (item) => setState(() {
                      delaySelected = item!;
                    }),
                  ),
                ),
              ),
              const SizedBox(height: 18),
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
              const SizedBox(height: 34),
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
                  setState(() {
                    n = 3;
                    userProvider.regularWash(
                      context,
                      today,
                      delaySelected == '7 days'
                          ? 1
                          : delaySelected == '15 days'
                              ? 2
                              : 3,
                    );
                  });
                },
                child: const Text(
                  'Start your regular wash',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ],
    );
  }

  Widget thirdPart(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.6,
      width: MediaQuery.of(context).size.width * 0.85,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 50,
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  'Regular wash request sent',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Text(
                "Rescheduled or cancelled regular washes out of the time appointed will not be eligible for the discount, but don’t worry! We will notify you when the date is close.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromRGBO(122, 122, 122, 1),
                  fontWeight: FontWeight.w300,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
