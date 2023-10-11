import 'package:flutter/material.dart';

import '../ui.dart';

class VehiclesPage extends StatefulWidget {
  const VehiclesPage({super.key});

  @override
  State<VehiclesPage> createState() => _VehiclesPageState();
}

class _VehiclesPageState extends State<VehiclesPage> {
  @override
  Widget build(BuildContext context) {
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
                            'My Vehicles',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                      notificationGeralButtonComponent(context),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Column(
                    children: [
                      vehicleBox(),
                      vehicleBox(),
                      vehicleBox(),
                      vehicleBox(),
                      vehicleBox(),
                      vehicleBox(),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(AppRoutes.VEHICLES_EDIT);
                        },
                        child: const Text(
                          'Register another Vehicle',
                          style: TextStyle(
                            color: Colors.amber,
                            fontWeight: FontWeight.bold,
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

  Widget vehicleBox() {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Nissan',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                            padding: const EdgeInsets.all(0),
                            splashRadius: 20,
                            iconSize: 18.0,
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed(AppRoutes.VEHICLES_EDIT);
                            },
                            icon: const Icon(Icons.edit_outlined)),
                        IconButton(
                            padding: const EdgeInsets.all(0),
                            splashRadius: 20,
                            iconSize: 18.0,
                            onPressed: () {},
                            icon: const Icon(Icons.delete_outline)),
                      ],
                    ),
                  ],
                ),
                const Text(
                  'Mach',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  'Red',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  '3SAM123',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'Small',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
