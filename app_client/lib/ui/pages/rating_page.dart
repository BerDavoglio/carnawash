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
  bool wasRated = true;

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
                      const Text(
                        'Rate us',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
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
    );
  }

  Column ratePart(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 60),
        const Text(
          'Rate Us!',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          "Dont forget to rate our services! This is how we can improve to always serve you well.",
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
          onRatingUpdate: (rating) {
            print(rating);
          },
        ),
        const SizedBox(height: 10),
        const Text('Let us know your feedback:'),
        const SizedBox(height: 10),
        geralMultilineTextInput(
            context: context, text: '', textController: rateController)
      ],
    );
  }

  Widget confirmPart(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
          ),
          const Text(
            'Thank you for your rating!',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 10),
          const Icon(
            Icons.star,
            color: Colors.amber,
          )
        ],
      ),
    );
  }
}
