import 'package:flutter/material.dart';

import '../ui.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  List<String> listBank = ['Bank 1', 'Bank 2', 'Bank 3'];
  String? bankSelected;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController abnController = TextEditingController();
  TextEditingController licenceController = TextEditingController();
  TextEditingController bankController = TextEditingController();
  TextEditingController accountController = TextEditingController();
  TextEditingController photoController = TextEditingController();
  bool edit = false;

  @override
  void initState() {
    super.initState();

    bankSelected = listBank[0];
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
                  const SizedBox(height: 15),
                  !edit
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                'Basic information info',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            geralInativeTextInput(
                              context: context,
                              text: 'Name',
                            ),
                            geralInativeTextInput(
                              context: context,
                              text: 'Email',
                            ),
                            geralInativeTextInput(
                              context: context,
                              text: 'Phone Number',
                            ),
                            geralInativeTextInput(
                              context: context,
                              text: 'Address',
                            ),
                            geralInativeTextInput(
                              context: context,
                              text: 'ABN',
                            ),
                            geralInativeTextInput(
                              context: context,
                              text: "Driver's Licence number or passport",
                            ),
                            geralInativeIconTextInput(
                              icon: Icons.upload_file,
                              context: context,
                              text: "Original Photo",
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                'Bank Information',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.85,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Colors.grey[400]!),
                                  borderRadius:
                                      const BorderRadius.all(Radius.circular(10))),
                              child: DropdownButton(
                                isExpanded: true,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 5,
                                  horizontal: 10,
                                ),
                                value: bankSelected,
                                items: listBank
                                    .map((item) => DropdownMenuItem<String>(
                                          value: item,
                                          child: Text(item),
                                        ))
                                    .toList(),
                                onChanged: null,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            geralInativeTextInput(
                              context: context,
                              text: "Bank Details Name",
                            ),
                            geralInativeTextInput(
                              context: context,
                              text: "Account Number",
                            ),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  edit = true;
                                });
                              },
                              child: const Text(
                                'Edit Information',
                                style: TextStyle(
                                  color: Colors.amber,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                'Basic information info',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
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
                            ),
                            geralTextInput(
                              context: context,
                              text: 'Address',
                              textController: addressController,
                            ),
                            geralTextInput(
                              context: context,
                              text: 'ABN',
                              textController: abnController,
                            ),
                            geralTextInput(
                              context: context,
                              text: "Driver's Licence number or passport",
                              textController: licenceController,
                            ),
                            geralIconTextInput(
                              icon: Icons.upload_file,
                              context: context,
                              text: "Original Photo",
                              textController: photoController,
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                'Bank Information',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.85,
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
                                value: bankSelected,
                                items: listBank
                                    .map((item) => DropdownMenuItem<String>(
                                          value: item,
                                          child: Text(item),
                                        ))
                                    .toList(),
                                onChanged: (item) => setState(() {
                                  bankSelected = item!;
                                }),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            geralTextInput(
                              context: context,
                              text: "Bank Details Name",
                              textController: bankController,
                            ),
                            geralTextInput(
                              context: context,
                              text: "Account Number",
                              textController: accountController,
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
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              ),
                              onPressed: () {
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
