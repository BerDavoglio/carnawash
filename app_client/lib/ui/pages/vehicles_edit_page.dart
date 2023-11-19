// ignore_for_file: no_logic_in_create_state, must_be_immutable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/data.dart';
import '../../infra/infra.dart';
import '../ui.dart';

class VehiclesEditPage extends StatefulWidget {
  CarModel? preData;

  VehiclesEditPage({
    super.key,
    this.preData,
  });

  @override
  State<VehiclesEditPage> createState() => _VehiclesEditPageState();
}

class _VehiclesEditPageState extends State<VehiclesEditPage> {
  TextEditingController registrationController = TextEditingController();
  List<BrandModel> listBrand = [];
  List<ModelModel> listModel = [];
  List<String> listColor = [
    'Black',
    'White',
    'Grey',
    'Red',
    'Blue',
    'Yellow',
    'Green',
    'Purple'
  ];
  String? brandSelected;
  String? modelSelected;
  String? colorSelected;
  int sizeSelected = 1;
  bool? initial;
  late bool edit;

  @override
  void initState() {
    super.initState();

    if (widget.preData != null) {
      edit = true;
      brandSelected = widget.preData!.brand;
      modelSelected = widget.preData!.model;
      colorSelected = widget.preData!.color;
      registrationController.text = widget.preData!.plate;
      sizeSelected = widget.preData!.car_size_id;
    } else {
      edit = false;

      WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
        VehiclesProvider vehiclesProvider = Provider.of(context);

        await vehiclesProvider.loadBrands(context);
        listBrand = vehiclesProvider.brandList;
        brandSelected = listBrand[0].name;
      });
      colorSelected = listColor[0];
    }
  }

  @override
  Widget build(BuildContext context) {
    VehiclesProvider vehicleProvider = Provider.of(context);
    ServicesProvider servicesProvider = Provider.of(context);

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
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          backButtonComponent(context),
                          Text(
                            edit ? 'Edit Vehicle' : 'Register',
                            style: const TextStyle(
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
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          'My Car Details',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.85,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.grey[700]!),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10))),
                            child: DropdownButton(
                              isExpanded: true,
                              padding: const EdgeInsets.symmetric(
                                vertical: 5,
                                horizontal: 10,
                              ),
                              value: brandSelected,
                              items: listBrand
                                  .map((item) => DropdownMenuItem<String>(
                                        value: item.name,
                                        child: Text(item.name),
                                      ))
                                  .toList(),
                              onChanged: (item) => setState(() async {
                                brandSelected = item!;
                                VehiclesProvider vehiclesProvider =
                                    Provider.of(context);
                                await vehiclesProvider
                                    .loadModels(context, item)
                                    .then(
                                      (value) => {
                                        listModel = vehiclesProvider.modelList
                                      },
                                    );
                              }),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.85,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.grey[700]!),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10))),
                            child: DropdownButton(
                              isExpanded: true,
                              padding: const EdgeInsets.symmetric(
                                vertical: 5,
                                horizontal: 10,
                              ),
                              value: modelSelected,
                              items: listModel
                                  .map((item) => DropdownMenuItem<String>(
                                        value: item.name,
                                        child: Text(item.name),
                                      ))
                                  .toList(),
                              onChanged: (item) => setState(() {
                                modelSelected = item!;
                              }),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.85,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.grey[700]!),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10))),
                            child: DropdownButton(
                              isExpanded: true,
                              padding: const EdgeInsets.symmetric(
                                vertical: 5,
                                horizontal: 10,
                              ),
                              value: colorSelected,
                              items: listColor
                                  .map((item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(item),
                                      ))
                                  .toList(),
                              onChanged: (item) => setState(() {
                                colorSelected = item!;
                              }),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          geralTextInput(
                            context: context,
                            text: 'Registration Number',
                            textController: registrationController,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: const Padding(
                              padding: EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'What is the size of your vehicle?',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    'Not sure? Check below for more information.',
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: List.generate(
                              servicesProvider.carSizeList.length,
                              (index) => SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: ListTile(
                                  title: Text(
                                    servicesProvider.carSizeList[index].title,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  subtitle: Text(
                                    servicesProvider.carSizeList[index]
                                        .additional_information,
                                    style: const TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                  leading: Radio(
                                    value:
                                        servicesProvider.carSizeList[index].id,
                                    groupValue: sizeSelected,
                                    fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.black,
                                    ),
                                    onChanged: (value) {
                                      setState(
                                        () {
                                          sizeSelected = value!;
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          TextButton(
                            style: ButtonStyle(
                              elevation: MaterialStateProperty.all(5),
                              fixedSize: MaterialStateProperty.all<Size>(
                                Size(MediaQuery.of(context).size.width * 0.85,
                                    50),
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
                            onPressed: () async {
                              if (brandSelected != '' &&
                                  modelSelected != '' &&
                                  registrationController.text != '' &&
                                  colorSelected != '') {
                                edit
                                    ? await vehicleProvider.updateCar(
                                        context,
                                        CarModel(
                                          brand: brandSelected!,
                                          model: modelSelected!,
                                          plate: registrationController.text,
                                          color: colorSelected!,
                                          car_size_id: sizeSelected,
                                        ),
                                      )
                                    : await vehicleProvider.createCar(
                                        context,
                                        CarModel(
                                          brand: brandSelected!,
                                          model: modelSelected!,
                                          plate: registrationController.text,
                                          color: colorSelected!,
                                          car_size_id: sizeSelected,
                                        ),
                                      );
                                Navigator.of(context).pop();
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: const Text(
                                        'All fields need to be filled!'),
                                    action: SnackBarAction(
                                      label: 'Okay',
                                      onPressed: () {},
                                    ),
                                  ),
                                );
                              }
                            },
                            child: const Text(
                              'Save',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
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
}
