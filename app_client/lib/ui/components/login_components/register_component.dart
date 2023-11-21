// ignore_for_file: use_build_context_synchronously

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/data.dart';
import '../../../infra/infra.dart';
import '../../ui.dart';

class RegisterComponent extends StatefulWidget {
  const RegisterComponent({
    super.key,
  });

  @override
  State<RegisterComponent> createState() => _RegisterComponentState();
}

class _RegisterComponentState extends State<RegisterComponent> {
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
  int n = 0;
  int sizeSelected = 1;
  bool hidden = true;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      VehiclesProvider vehiclesProvider = Provider.of(context, listen: false);
      ServicesProvider servicesProvider = Provider.of(context, listen: false);

      await servicesProvider.loadCarsize(context);
      await vehiclesProvider.loadBrands(context);
      listBrand = vehiclesProvider.brandList;
      brandSelected = listBrand[0].name;
    });
    colorSelected = listColor[0];
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController addressController = TextEditingController();
    TextEditingController registrationController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController passConfirmController = TextEditingController();
    UserProvider userProvider = Provider.of(
      context,
      listen: false,
    );

    return Column(
      children: [
        n == 0
            ? firstPart(
                context,
                nameController,
                emailController,
                phoneController,
                addressController,
              )
            : n == 1
                ? secondPart(
                    context,
                    registrationController,
                  )
                : thirdPart(
                    context,
                    passwordController,
                    passConfirmController,
                  ),
        Padding(
          padding: const EdgeInsets.all(5),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(237, 189, 58, 1),
                fixedSize: Size(MediaQuery.of(context).size.width * 0.85, 50)),
            onPressed: () {
              if (n != 2) {
                setState(() {
                  n++;
                });
              } else {
                setState(() async {
                  await userProvider.signIn(
                    context,
                    UserSignModel(
                      email: emailController.text,
                      password: passwordController.text,
                      name: nameController.text,
                      address: addressController.text,
                      phone: phoneController.text,
                    ),
                    CarModel(
                      brand: brandSelected!,
                      model: modelSelected!,
                      color: colorSelected!,
                      plate: registrationController.text,
                      car_size_id: sizeSelected,
                    ),
                  );
                });
              }
            },
            child: const Text('Next'),
          ),
        ),
        TextButton(
          onPressed: () {
            setState(() {
              if (n != 0) {
                n--;
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(index: 1),
                  ),
                );
              }
            });
          },
          child: const Text(
            "Back",
            style: TextStyle(
              color: Colors.white,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: 20,
            ),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  const TextSpan(
                    text:
                        'By creating an account I agree to the terms and conditions of our ',
                    style: TextStyle(color: Colors.white),
                  ),
                  TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () =>
                          Navigator.of(context).pushNamed(AppRoutes.TERMS),
                    text: 'Terms of Service',
                    style: const TextStyle(
                      color: Color.fromRGBO(237, 189, 58, 1),
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  const TextSpan(
                    text: '.',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget firstPart(
    BuildContext context,
    TextEditingController nameController,
    TextEditingController emailController,
    TextEditingController phoneController,
    TextEditingController addressController,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          const Text(
            'Basic Account Info',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          geralTextInput(
            context: context,
            text: 'Name',
            textController: nameController,
          ),
          geralTextInput(
            context: context,
            text: 'E-mail',
            textController: emailController,
          ),
          geralTextInput(
              context: context,
              text: 'Phone Number',
              textController: phoneController,
              type: TextInputType.phone),
          geralTextInput(
            context: context,
            text: 'Address',
            textController: addressController,
          ),
        ],
      ),
    );
  }

  Widget secondPart(
    BuildContext context,
    TextEditingController registrationController,
  ) {
    ServicesProvider servicesProvider = Provider.of(context, listen: false);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          const Text(
            'My Car Details',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.85,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey[700]!),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
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
                    onChanged: (item) async {
                      setState(() {
                        brandSelected = item!;
                      });
                      VehiclesProvider vehiclesProvider =
                          Provider.of(context, listen: false);
                      await vehiclesProvider.loadModels(context, item!).then(
                            (value) => {listModel = vehiclesProvider.modelList},
                          );
                    }),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.85,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey[700]!),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
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
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
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
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'Not sure? Check below for more information.',
                        style: TextStyle(
                          color: Colors.white,
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
                        servicesProvider
                            .carSizeList[index].additional_information,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      leading: Radio(
                        value: servicesProvider.carSizeList[index].id,
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
            ],
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  Widget thirdPart(
    BuildContext context,
    TextEditingController passwordController,
    TextEditingController passConfirmController,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          const Text(
            'Register your Password',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          passwordTextInput(
            context,
            passwordController,
            () => setState(() {
              hidden = !hidden;
            }),
            hidden,
          ),
          passwordConfirmTextInput(
            context,
            passConfirmController,
          ),
        ],
      ),
    );
  }
}
