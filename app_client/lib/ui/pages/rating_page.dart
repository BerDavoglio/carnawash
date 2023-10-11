import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../ui.dart';

class RatingPage extends StatefulWidget {
  const RatingPage({super.key});

  @override
  State<RatingPage> createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
  TextEditingController rateController = TextEditingController();
  bool wasRated = false;

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
                            'Rate us',
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
                  wasRated ? confirmPart(context) : ratePart(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget ratePart(BuildContext context) {
    return SizedBox(
      // height: MediaQuery.of(context).size.height * 0.6,
      width: MediaQuery.of(context).size.width * 0.85,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              const SizedBox(height: 60),
              const Text(
                'Rate Us!',
                style: TextStyle(),
              ),
              const SizedBox(height: 10),
              const Text(
                "Dont forget to rate our services!\nThis is how we can improve to always serve you well.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 10),
              RatingBar.builder(
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                itemSize: 30,
                onRatingUpdate: (rating) {

                },
              ),
              const SizedBox(height: 10),
              const Text('Let us know your feedback:'),
              const SizedBox(height: 10),
              geralMultilineTextInput(
                context: context,
                text: '',
                textController: rateController,
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
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            onPressed: () {
              setState(() {
                    wasRated = true;
                  });
            },
            child: const Text(
              'Sent',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget confirmPart(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      width: MediaQuery.of(context).size.width * 0.85,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Text(
                'Thank you for your rating!',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 20),
              Icon(
                Icons.star,
                color: Colors.amber,
                size: 30,
              )
            ],
          ),
        ],
      ),
    );
  }
}
