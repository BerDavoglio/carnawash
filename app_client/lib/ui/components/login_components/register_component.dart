import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../ui.dart';

class RegisterComponent extends StatefulWidget {
  const RegisterComponent({
    super.key,
  });

  @override
  State<RegisterComponent> createState() => _RegisterComponentState();
}

class _RegisterComponentState extends State<RegisterComponent> {
  List<String> listBrand = ['Brand 1', 'Brand 2', 'Brand 3'];
  List<String> listModel = ['Model 1', 'Model 2', 'Model 3'];
  List<String> listColor = ['Color 1', 'Color 2', 'Color 3'];
  String? brandSelected;
  String? modelSelected;
  String? colorSelected;
  int n = 1;
  int sizeSelected = 1;
  bool hidden = true;

  @override
  void initState() {
    super.initState();

    brandSelected = listBrand[0];
    modelSelected = listModel[0];
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
                backgroundColor: Colors.amber,
                fixedSize: Size(MediaQuery.of(context).size.width * 0.9, 50)),
            onPressed: () {
              setState(() {
                if (n != 2) {
                  n++;
                } else {
                  Navigator.of(context).pushReplacementNamed(AppRoutes.HOME);
                }
              });
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
                      color: Colors.amber,
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
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey[700]!),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
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
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey[700]!),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
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
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey[700]!),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
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
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
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
                children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ListTile(
                      title: const Text(
                        'Small',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: const Text(
                        'Compact, subcompact cars: sedan, hatchback, wagon, sports, coupe.',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      leading: Radio(
                        value: 1,
                        groupValue: sizeSelected,
                        fillColor: MaterialStateColor.resolveWith(
                          (states) => Colors.white,
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
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: const Text(
                        '2WDs, UTE 2WDs, Medium-size cars, customers.',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      leading: Radio(
                        value: 2,
                        groupValue: sizeSelected,
                        fillColor: MaterialStateColor.resolveWith(
                          (states) => Colors.white,
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
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: const Text(
                        'UTE 4WD, 4WD SUVs 5-7 seaters.',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      leading: Radio(
                        value: 3,
                        groupValue: sizeSelected,
                        fillColor: MaterialStateColor.resolveWith(
                          (states) => Colors.white,
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
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: const Text(
                        'UTE 4WD extra-large models 5 – 7 seaters, people movers, Mini Vans.',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      leading: Radio(
                        value: 4,
                        groupValue: sizeSelected,
                        fillColor: MaterialStateColor.resolveWith(
                          (states) => Colors.white,
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
