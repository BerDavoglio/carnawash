// ignore_for_file: must_be_immutable, no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../ui.dart';

class SchedulePage extends StatefulWidget {
  int? initial;

  SchedulePage({
    super.key,
    required this.initial,
  });

  @override
  State<SchedulePage> createState() => _SchedulePageState(
        initial: initial,
      );
}

class _SchedulePageState extends State<SchedulePage> {
  DateTime today = DateTime.now();
  TextEditingController addressController = TextEditingController();
  TextEditingController couponController = TextEditingController();
  int carSelected = 1;
  int washSelected = 1;
  int? initial;
  late int n;

  _SchedulePageState({required this.initial});

  @override
  void initState() {
    super.initState();

    n = initial ?? 1;

    // LOAD PRÉ SELECTED VALUES
    // LOAD VALUES FROM SERVICES
  }

  TimeOfDay _time = TimeOfDay(
    hour: DateTime.now().hour,
    minute: DateTime.now().minute,
  );

  void _selectTime() async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: _time,
      initialEntryMode: TimePickerEntryMode.input,
    );
    if (newTime != null) {
      setState(() {
        _time = newTime;
      });
    }
  }

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
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
                              backgroundColor: const Color.fromRGBO(237, 189, 58, 1),
                              child: IconButton(
                                iconSize: 24,
                                color: Colors.white,
                                icon: const Icon(
                                  Icons.arrow_back,
                                ),
                                onPressed: () => {
                                  if (n == 6)
                                    {
                                      n == 1,
                                      Navigator.of(context)
                                          .pushReplacementNamed(AppRoutes.HOME),
                                    }
                                  else if (n == 1)
                                    {
                                      Navigator.of(context)
                                          .pushReplacementNamed(AppRoutes.HOME),
                                    }
                                  else if (initial == 3)
                                    {
                                      Navigator.of(context).pop(),
                                    }
                                  else
                                    {
                                      setState(() {
                                        n--;
                                      })
                                    }
                                },
                              ),
                            ),
                          ),
                          const Text(
                            'Schedule',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      notificationGeralButtonComponent(context),
                    ],
                  ),
                  const SizedBox(height: 16),
                  n == 1
                      ? firstPart(context)
                      : n == 2
                          ? secondPart(context)
                          : n == 3
                              ? thirdPart(context)
                              : n == 4
                                  ? fourthPart(context)
                                  : n == 5
                                      ? fifthPart(context)
                                      : sixthPart(context),
                  (n == 5 || n == 6)
                      ? const SizedBox()
                      : TextButton(
                          style: ButtonStyle(
                            elevation: MaterialStateProperty.all(5),
                            fixedSize: MaterialStateProperty.all<Size>(
                              Size(
                                  MediaQuery.of(context).size.width * 0.85, 50),
                            ),
                            backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromRGBO(237, 189, 58, 1),
                            ),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                          child: const Text(
                            'Next',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              n++;
                            });
                          },
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

  Column firstPart(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.85,
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Choose your car to be washed',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 16),
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
          width: MediaQuery.of(context).size.width * 0.85,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: List.generate(
                6,
                (index) {
                  return selectCarBox(
                    context,
                    index,
                  );
                },
              ),
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => VehiclesEditPage(initial: false),
              ),
            );
          },
          child: const Text(
            'Choose another car to be washed',
            style: TextStyle(color: Color.fromRGBO(237, 189, 58, 1), fontSize: 18),
          ),
        ),
      ],
    );
  }

  Widget selectCarBox(
    BuildContext context,
    int index,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        visualDensity: const VisualDensity(
          horizontal: VisualDensity.minimumDensity,
          vertical: VisualDensity.minimumDensity,
        ),
        title: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nissan',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'March',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                Text(
                  'Red',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                Text(
                  '3SAM123',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Small',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
        leading: Radio(
          splashRadius: 20,
          visualDensity: const VisualDensity(
            horizontal: VisualDensity.minimumDensity,
            vertical: VisualDensity.minimumDensity,
          ),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          value: index,
          groupValue: carSelected,
          fillColor: MaterialStateColor.resolveWith(
            (states) => Colors.black,
          ),
          onChanged: (value) {
            setState(() {
              carSelected = value!;
            });
          },
        ),
      ),
    );
  }

  Column secondPart(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.85,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Confirm your Vehicle details',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: const Text(
                      'Vehicle 1',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                    ),
                    width: MediaQuery.of(context).size.width * 0.65,
                    height: 1,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              geralInativeTextInput(context: context, text: 'Nissan'),
              geralInativeTextInput(context: context, text: 'March'),
              geralInativeTextInput(context: context, text: 'Red'),
              geralInativeTextInput(context: context, text: '3SAM123'),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Small',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          'Compact, subcompact cars: sedan, hatchback, wagon, sports, coupe.',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Text(
                    '\$ 45',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Divider(),
              ),
              const Text(
                'Choose the type of washing',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ListTile(
                      title: const Text(
                        'Wash outside only',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      leading: Radio(
                        value: 1,
                        groupValue: washSelected,
                        fillColor: MaterialStateColor.resolveWith(
                          (states) => Colors.black,
                        ),
                        onChanged: (value) {
                          setState(() {
                            washSelected = value!;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ListTile(
                      title: const Text(
                        'Wash inside & outside',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      subtitle: const Text(
                        '+ \$ 40.00',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      leading: Radio(
                        value: 2,
                        groupValue: washSelected,
                        fillColor: MaterialStateColor.resolveWith(
                          (states) => Colors.black,
                        ),
                        onChanged: (value) {
                          setState(() {
                            washSelected = value!;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              if (washSelected == 2)
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                  ),
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: const Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '\u2713 100% hand-polished premium carnauba wax',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          '\u2713 Windows cleaned outside &amp; and inside',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          '\u2713 Wheels Cleaned',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          '\u2713 Tires cleaned',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          '\u2713 Door Jams cleaned',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          '\u2713 Interior Vacuumed',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          '\u2713 Dashboards and doors wiped dusted and polished',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          '\u2713 Bug &amp; tar Removal',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Divider(),
              ),
              const Text(
                'Add our additional services',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      additionalBoxComponent(
                        context: context,
                        text: 'Pet Hair',
                        icon: Icons.pets_outlined,
                        value: '15.00',
                      ),
                      const SizedBox(height: 16),
                      additionalBoxComponent(
                        context: context,
                        text: 'Extra Dirty',
                        icon: Icons.clean_hands,
                        value: '20.00',
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      additionalBoxComponent(
                        context: context,
                        text: 'Seats wiped',
                        icon: Icons.airline_seat_recline_normal,
                        value: '15.00',
                      ),
                      const SizedBox(height: 16),
                      additionalBoxComponent(
                        context: context,
                        text: 'Heavy Dirty',
                        icon: Icons.local_car_wash,
                        value: '40.00',
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                width: MediaQuery.of(context).size.width * 0.85,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: Colors.grey.withOpacity(0.1),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Your vehicle price',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        '\$ 65.00',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ],
    );
  }

  Widget additionalBoxComponent({
    required BuildContext context,
    required String text,
    required IconData icon,
    required String value,
  }) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.42,
      height: MediaQuery.of(context).size.width * 0.42,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: Colors.grey)),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 60,
              color: Colors.grey,
            ),
            Text(
              text,
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
            TextButton(
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all<Size>(
                  const Size(100, 30),
                ),
                backgroundColor: MaterialStateProperty.all<Color>(
                  Colors.grey,
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
              ),
              onPressed: () {},
              child: Text(
                '+ \$ $value',
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Column thirdPart(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.85,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Choose the day and time',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
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
              ElevatedButton(
                onPressed: _selectTime,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(237, 189, 58, 1)),
                ),
                child: const Text('Select Time'),
              ),
              const SizedBox(height: 16),
              const Text(
                'Enter the address',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 16),
              geralTextInput(
                context: context,
                text: 'Address',
                textController: addressController,
              ),
              geralMultilineTextInput(
                context: context,
                text: 'Observation about the place',
                textController: addressController,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Column fourthPart(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.85,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Confirm your booking',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: const Text(
                      'Vehicle 1',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                    ),
                    width: MediaQuery.of(context).size.width * 0.65,
                    height: 1,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Vehicle',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Nissan - March\nRed\n3SAM123\nSmall',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      color: Colors.grey.withOpacity(0.3),
                    ),
                    child: const Center(
                        child: Text(
                      '\$ 45.00',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                  ),
                ],
              ),
              const Column(
                children: [
                  SizedBox(height: 16),
                  Divider(),
                  SizedBox(height: 16),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Type of washing',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Wash outside only',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Column(
                children: [
                  SizedBox(height: 16),
                  Divider(),
                  SizedBox(height: 16),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Addicional Service',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Pet Hair',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      color: Colors.grey.withOpacity(0.3),
                    ),
                    child: const Center(
                        child: Text(
                      '\$ 15.00',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                  ),
                ],
              ),
              const Column(
                children: [
                  SizedBox(height: 16),
                  Divider(),
                  SizedBox(height: 16),
                ],
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '15 September 23',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '10:00\nMonaco St. Bundall - Australia',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const Column(
                children: [
                  SizedBox(height: 16),
                  Divider(),
                  SizedBox(height: 16),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.85,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: Colors.grey.withOpacity(0.1),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total:',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        '\$ 65.00',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ],
    );
  }

  Widget fifthPart(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height - 205,
          width: MediaQuery.of(context).size.width * 0.85,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Do you have a coupon?',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 16),
                  geralTextInput(
                    context: context,
                    text: 'Type the code',
                    textController: couponController,
                  ),
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total:',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Text(
                          '\$ 125.00',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  creditCardButton(context),
                  Center(
                    child: TextButton(
                      style: ButtonStyle(
                          padding:
                              MaterialStateProperty.all(EdgeInsets.zero)),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const WalletPage(),
                          ),
                        );
                      },
                      child: const Text(
                        'Pay with another credit card',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(237, 189, 58, 1),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget creditCardButton(BuildContext context) {
    return Column(
      children: [
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            side: const BorderSide(width: 2, color: Colors.blue),
            fixedSize: Size(MediaQuery.of(context).size.width * 0.85, 50),
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {
            // CREATE SCHEDULE
            setState(() {
              n++;
            });
          },
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Pay credit card **** 4321',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              Image(
                height: 30,
                image: AssetImage('images/visa-logo.png'),
              )
            ],
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget sixthPart(BuildContext context) {
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
                  'Booking requested',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Text(
                'You will be informed when confirmed',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
