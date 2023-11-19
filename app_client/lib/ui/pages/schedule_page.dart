// ignore_for_file: must_be_immutable, no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../data/data.dart';
import '../../infra/infra.dart';
import '../ui.dart';

class SchedulePage extends StatefulWidget {
  int? initial;
  List<CarObjectModel>? preData;

  SchedulePage({
    super.key,
    required this.initial,
    this.preData,
  });

  @override
  State<SchedulePage> createState() => _SchedulePageState(
        initial: initial,
      );
}

class _SchedulePageState extends State<SchedulePage> {
  TextEditingController addressController = TextEditingController();
  TextEditingController observationController = TextEditingController();
  TextEditingController couponController = TextEditingController();
  DateTime today = DateTime.now();
  int carSelected = 1;
  int washSelected = 1;
  int? initial;
  double additionalPrice = 0;
  List<CarObjectModel> listCars = [];
  List<int> listAddon = [];
  late int n;
  late CarModel carSelectedModel;

  _SchedulePageState({required this.initial});

  @override
  void initState() {
    super.initState();

    n = initial ?? 1;

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      ServicesProvider servicesProvider = Provider.of(
        context,
        listen: false,
      );

      await servicesProvider.loadAdditional(context).then(
            (value) async => {
              await servicesProvider.loadCarsize(context),
            },
          );
    });
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

  Future<void> _loadCarSelected(BuildContext context) async {
    VehiclesProvider vehiclesProvider = Provider.of(context);
    await vehiclesProvider.loadOneCar(context, carSelected);
  }

  double priceCalculate(BuildContext context, CarModel car, int washSelect) {
    ServicesProvider servicesProvider = Provider.of(context);
    double carValue =
        double.parse(servicesProvider.getCarsizeComplete(car.id!).price);

    double select = washSelect == 1 ? 0 : 40;

    return (carValue + select + additionalPrice);
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
                              backgroundColor:
                                  const Color.fromRGBO(237, 189, 58, 1),
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
                          ? secondPart(
                              context,
                              carSelectedModel,
                            )
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
                            setState(() async {
                              if (n == 1) {
                                await _loadCarSelected(context);
                              }
                              if (n == 2) {
                                listCars.add(
                                  CarObjectModel(
                                    car_id: carSelectedModel.id!,
                                    wash_type: washSelected,
                                    additional_list_id: listAddon,
                                  ),
                                );
                              }
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
    VehiclesProvider vehiclesProvider = Provider.of(context);

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
                vehiclesProvider.carsList.length,
                (index) {
                  return selectCarBox(
                    context,
                    index,
                    vehiclesProvider.carsList[index],
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
                builder: (context) => VehiclesEditPage(),
              ),
            );
          },
          child: const Text(
            'Choose another car to be washed',
            style:
                TextStyle(color: Color.fromRGBO(237, 189, 58, 1), fontSize: 18),
          ),
        ),
      ],
    );
  }

  Widget selectCarBox(
    BuildContext context,
    int index,
    CarModel car,
  ) {
    ServicesProvider servicesProvider = Provider.of(context);

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
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  car.brand,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  car.model,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
                Text(
                  car.color,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
                Text(
                  car.plate,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  servicesProvider.getCarsizeComplete(car.car_size_id).title,
                  style: const TextStyle(
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

  Column secondPart(
    BuildContext context,
    CarModel carSelec,
  ) {
    ServicesProvider servicesProvider = Provider.of(context);

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
              geralInativeTextInput(context: context, text: carSelec.brand),
              geralInativeTextInput(context: context, text: carSelec.model),
              geralInativeTextInput(context: context, text: carSelec.color),
              geralInativeTextInput(context: context, text: carSelec.plate),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          servicesProvider
                              .getCarsizeComplete(carSelec.car_size_id)
                              .title,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          servicesProvider
                              .getCarsizeComplete(carSelec.car_size_id)
                              .additional_information,
                          style: const TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    '\$ ${servicesProvider.getCarsizeComplete(carSelec.car_size_id).price}',
                    style: const TextStyle(
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
              GridView.count(
                crossAxisCount: 2,
                children: List.generate(
                  servicesProvider.additionalList.length,
                  (index) {
                    return Center(
                      child: additionalBoxComponent(
                        context: context,
                        add: servicesProvider.additionalList[index],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
              Container(
                width: MediaQuery.of(context).size.width * 0.85,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: Colors.grey.withOpacity(0.1),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Your vehicle price',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        '\$ ${priceCalculate(context, carSelec, washSelected)}',
                        style: const TextStyle(
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
    required AdditionalModel add,
  }) {
    late IconData icon;
    if (add.title == 'Pet Hair') {
      icon = Icons.pets_outlined;
    } else if (add.title == 'Extra Dirty') {
      icon = Icons.clean_hands;
    } else if (add.title == 'Seats wiped') {
      icon = Icons.airline_seat_recline_normal;
    } else if (add.title == 'Heavy Dirty') {
      icon = Icons.local_car_wash;
    } else {
      icon = Icons.add;
    }

    bool selected = false;

    void changeSelected() {
      setState(() {
        selected = !selected;
      });
    }

    return Container(
      width: MediaQuery.of(context).size.width * 0.42,
      height: MediaQuery.of(context).size.width * 0.42,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: (selected ? Colors.blue : Colors.grey))),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 60,
              color: (selected ? Colors.blue : Colors.grey),
            ),
            Text(
              add.title,
              style: TextStyle(
                color: (selected ? Colors.blue : Colors.grey),
              ),
            ),
            TextButton(
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all<Size>(
                  const Size(100, 30),
                ),
                backgroundColor: MaterialStateProperty.all<Color>(
                  (selected ? Colors.blue : Colors.grey),
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
              ),
              onPressed: () {
                if (selected) {
                  setState(() {
                    changeSelected();
                    additionalPrice += double.parse(add.price);
                  });
                } else {
                  setState(() {
                    changeSelected();
                    additionalPrice -= double.parse(add.price);
                  });
                }
              },
              child: Text(
                '+ \$ ${add.price}',
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
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromRGBO(237, 189, 58, 1)),
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
                textController: observationController,
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
    UserProvider userProvider = Provider.of(context);

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
                  creditCardButton(
                    context,
                    CardModel(
                      user_id: userProvider.perfil.id!,
                      name: userProvider.perfil.name,
                      last_digits: '4321',
                      date: '03/27',
                    ),
                  ),
                  Center(
                    child: TextButton(
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(EdgeInsets.zero)),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const WalletPage(),
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

  Widget creditCardButton(
    BuildContext context,
    CardModel card,
  ) {
    ScheduleProvider scheduleProvider = Provider.of(context);
    TextEditingController threeController = TextEditingController();

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
            showDialog<void>(
              context: context,
              builder: (ctx) => AlertDialog(
                title: const Text('title'),
                content: TextField(
                  onChanged: (value) {},
                  controller: threeController,
                  decoration: const InputDecoration(hintText: "CVV"),
                ),
                actions: [
                  TextButton(
                    child: const Text('Ok'),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            );
            if (widget.preData != null) {
              scheduleProvider.createSchedule(
                  context,
                  CreateScheduleModel(
                    cars_obj_list: widget.preData!,
                    selected_date: today,
                    address: addressController.text,
                    observation_address: observationController.text,
                    coupon_id: int.parse(couponController.text),
                    credit_card_id: card.id!,
                    three: int.parse(threeController.text),
                  ));
            } else {
              scheduleProvider.createSchedule(
                  context,
                  CreateScheduleModel(
                    cars_obj_list: listCars,
                    selected_date: today,
                    address: addressController.text,
                    observation_address: observationController.text,
                    coupon_id: int.parse(couponController.text),
                    credit_card_id: card.id!,
                    three: int.parse(threeController.text),
                  ));
            }
            setState(() {
              n++;
            });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Pay credit card **** ${card.last_digits}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              const Image(
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
