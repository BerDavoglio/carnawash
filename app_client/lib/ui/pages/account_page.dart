import 'package:app_client/data/data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../infra/infra.dart';
import '../ui.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  bool edit = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      UserProvider userProvider = Provider.of(
        context,
        listen: false,
      );

      await userProvider.loadPerfil(context);

      nameController.text = userProvider.perfil.name;
      emailController.text = userProvider.perfil.email;
      phoneController.text = userProvider.perfil.phone;
      addressController.text = userProvider.perfil.address;
    });
  }

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of(
      context,
      listen: false,
    );

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
                          const Text(
                            'My Account Information',
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
                  !edit
                      ? Column(
                          children: [
                            geralInativeTextInput(
                                context: context,
                                textController: nameController),
                            geralInativeTextInput(
                                context: context,
                                textController: emailController),
                            geralInativeTextInput(
                                context: context,
                                textController: phoneController),
                            geralInativeTextInput(
                                context: context,
                                textController: addressController),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  edit = true;
                                });
                              },
                              child: const Text(
                                'Edit Information',
                                style: TextStyle(
                                  color: Color.fromRGBO(237, 189, 58, 1),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        )
                      : Column(
                          children: [
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
                            ),
                            geralTextInput(
                              context: context,
                              text: 'Address',
                              textController: addressController,
                            ),
                            TextButton(
                              style: ButtonStyle(
                                elevation: MaterialStateProperty.all(5),
                                fixedSize: MaterialStateProperty.all<Size>(
                                  Size(MediaQuery.of(context).size.width * 0.85,
                                      50),
                                ),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
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
                                await userProvider.updatePerfil(
                                  context,
                                  UserCompleteModel(
                                      name: nameController.text,
                                      email: emailController.text,
                                      phone: phoneController.text,
                                      address: addressController.text),
                                );
                                setState(() {
                                  edit = false;
                                });
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
