import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/data.dart';
import '../../infra/infra.dart';
import '../ui.dart';

class FAQPage extends StatefulWidget {
  const FAQPage({super.key});

  @override
  State<FAQPage> createState() => _FAQPageState();
}

class _FAQPageState extends State<FAQPage> {
  late List<bool> listOpens;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      FAQProvider faqProvider = Provider.of(
        context,
        listen: false,
      );

      await faqProvider.loadFAQ(context);

      listOpens = List.generate(
        faqProvider.faq.length,
        (index) {
          return false;
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    FAQProvider faqProvider = Provider.of(
      context,
      listen: false,
    );

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
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                      notificationGeralButtonComponent(context),
                    ],
                  ),
                  const SizedBox(height: 16),
                  geralIconTextInput(
                    context: context,
                    text: 'Search',
                    textController: searchController,
                    icon: Icons.search,
                  ),
                  Column(
                    children: List.generate(
                      faqProvider.faq.length,
                      (index) {
                        return faqBox(
                          context,
                          faqProvider.faq[index],
                          () => setState(() {
                            listOpens[index] =
                                !listOpens[index];
                          }),
                          index,
                        );
                      },
                    ),
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
    FAQModel obj,
    Function funct,
    int index,
  ) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.85,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(237, 189, 58, 1),
            borderRadius: !listOpens[index]
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
                    obj.question,
                  ),
                ),
                IconButton(
                  splashColor: Colors.white,
                  splashRadius: 10,
                  icon: Icon(!listOpens[index]
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
        listOpens[index]
            ? Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    )),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(obj.answer),
                ),
              )
            : const SizedBox(),
        const SizedBox(height: 16),
      ],
    );
  }
}
