import 'package:flutter/material.dart';

import '../ui.dart';

class VehiclesEditPage extends StatefulWidget {
  const VehiclesEditPage({super.key});

  @override
  State<VehiclesEditPage> createState() => _VehiclesEditPageState();
}

class _VehiclesEditPageState extends State<VehiclesEditPage> {
  TextEditingController registrationController = TextEditingController();
  List<String> listBrand = ['Brand 1', 'Brand 2', 'Brand 3'];
  List<String> listModel = ['Model 1', 'Model 2', 'Model 3'];
  List<String> listColor = ['Color 1', 'Color 2', 'Color 3'];
  String? brandSelected;
  String? modelSelected;
  String? colorSelected;
  int sizeSelected = 1;
  bool edit = false;

  @override
  void initState() {
    super.initState();

    brandSelected = listBrand[0];
    modelSelected = listModel[0];
    colorSelected = listColor[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: navigationBarComponent(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 50,
            left: 25,
            right: 25,
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
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  notificationGeralButtonComponent(context),
                ],
              ),
              const SizedBox(height: 15),
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
                        fontWeight: FontWeight.bold,
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
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        child: DropdownButton(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 10,
                          ),
                          value: brandSelected,
                          items: listBrand
                              .map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(item),
                                  ))
                              .toList(),
                          onChanged: (item) => setState(() {
                            brandSelected = item!;
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
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        child: DropdownButton(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 10,
                          ),
                          value: modelSelected,
                          items: listModel
                              .map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(item),
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
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        child: DropdownButton(
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
                                  fontWeight: FontWeight.bold,
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
                        children: <Widget>[
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: ListTile(
                              title: const Text(
                                'Small',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: const Text(
                                'Compact, subcompact cars: sedan, hatchback, wagon, sports, coupe.',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              leading: Radio(
                                value: 1,
                                groupValue: sizeSelected,
                                fillColor: MaterialStateColor.resolveWith(
                                  (states) => Colors.black,
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    sizeSelected = value!;
                                  });
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: ListTile(
                              title: const Text(
                                'SUVs',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: const Text(
                                '2WDs, UTE 2WDs, Medium-size cars, customers.',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              leading: Radio(
                                value: 2,
                                groupValue: sizeSelected,
                                fillColor: MaterialStateColor.resolveWith(
                                  (states) => Colors.black,
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    sizeSelected = value!;
                                  });
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: ListTile(
                              title: const Text(
                                '4WD SUVs',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: const Text(
                                'UTE 4WD, 4WD SUVs 5-7 seaters.',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              leading: Radio(
                                value: 3,
                                groupValue: sizeSelected,
                                fillColor: MaterialStateColor.resolveWith(
                                  (states) => Colors.black,
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    sizeSelected = value!;
                                  });
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: ListTile(
                              title: const Text(
                                'Extra Large 4WD SUVs',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: const Text(
                                'UTE 4WD extra-large models 5 – 7 seaters, people movers, Mini Vans.',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              leading: Radio(
                                value: 4,
                                groupValue: sizeSelected,
                                fillColor: MaterialStateColor.resolveWith(
                                  (states) => Colors.black,
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    sizeSelected = value!;
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      TextButton(
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all(5),
                          fixedSize: MaterialStateProperty.all<Size>(
                            Size(MediaQuery.of(context).size.width * 0.85, 50),
                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.amber,
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
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
    );
  }
}
