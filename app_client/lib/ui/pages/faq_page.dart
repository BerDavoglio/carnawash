import 'package:flutter/material.dart';

import '../ui.dart';

class FAQPage extends StatefulWidget {
  const FAQPage({super.key});

  @override
  State<FAQPage> createState() => _FAQPageState();
}

class Item {
  Item({
    required this.title,
    required this.subtitle,
    this.isOpen = false,
  });

  String title;
  String subtitle;
  bool isOpen;
}

class _FAQPageState extends State<FAQPage> {
  List<Item> list = [
    Item(
      title: 'Do I need to be present before, during, or after the service?',
      subtitle:
          "Not necessarily. The app will notify you once the washer arrives. You can also add specific instructions for the washer to follow on arrival within the booking notes, any questions and details can be communicating by the app message or call. If you choose not to be present for the arrival of the washer, please ensure the washer can easily find your car among by indicating the plate or the exact colour and model when placing the booking. Also be sure that the car is accessible, and unlocked if requiring an interior cleaning, please note the washer is not allowed to drive your car for parking or any circumstances. We strongly recommend checking the vehicle after the washer has completed the service to ensure you're thoroughly satisfied with the result!",
      isOpen: false,
    ),
    Item(
      title:
          'What condition should my car be to have a waterless carwash (outside wash)?',
      subtitle:
          "Any condition except excessive amounts of dirt, such as dried mud or other debris.",
      isOpen: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          backButtonComponent(context),
                          const Text(
                            'FAQ',
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
                  const SizedBox(height: 15),
                  geralIconTextInput(
                    context: context,
                    text: 'Search',
                    textController: searchController,
                    icon: Icons.search,
                  ),
                  Column(
                    children: [
                      faqBox(
                        context,
                        list[0],
                        () => setState(() {
                          list[0].isOpen = !list[0].isOpen;
                        }),
                      ),
                      faqBox(
                        context,
                        list[1],
                        () => setState(() {
                          list[1].isOpen = !list[1].isOpen;
                        }),
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

  Widget faqBox(
    BuildContext context,
    Item obj,
    Function funct,
  ) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.85,
          decoration: BoxDecoration(
            color: Colors.amber[300]!,
            borderRadius: !obj.isOpen
                ? const BorderRadius.all(
                    Radius.circular(10),
                  )
                : const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.65,
                  child: Text(
                    obj.title,
                  ),
                ),
                IconButton(
                  splashColor: Colors.white,
                  splashRadius: 10,
                  icon: Icon(!obj.isOpen
                      ? Icons.keyboard_arrow_down
                      : Icons.keyboard_arrow_down),
                  onPressed: () {
                    funct();
                  },
                )
              ],
            ),
          ),
        ),
        obj.isOpen
            ? Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    )),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(obj.subtitle),
                ),
              )
            : const SizedBox(),
        const SizedBox(height: 10),
      ],
    );
  }
}
