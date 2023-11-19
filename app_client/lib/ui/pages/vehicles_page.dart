import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/data.dart';
import '../../infra/infra.dart';
import '../ui.dart';

class VehiclesPage extends StatefulWidget {
  const VehiclesPage({super.key});

  @override
  State<VehiclesPage> createState() => _VehiclesPageState();
}

class _VehiclesPageState extends State<VehiclesPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      VehiclesProvider vehiclesProvider = Provider.of(context, listen: false);

      await vehiclesProvider.loadCars(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    VehiclesProvider vehiclesProvider = Provider.of(context);

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
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                      notificationGeralButtonComponent(context),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Column(
                    children: [
                      Column(
                        children: List.generate(
                          vehiclesProvider.carsList.length,
                          (index) async {
                            return await vehicleBox(
                              context,
                              vehiclesProvider.carsList[index],
                            );
                          } as Widget Function(int index),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => VehiclesEditPage(),
                            ),
                          );
                        },
                        child: const Text(
                          'Register another Vehicle',
                          style: TextStyle(
                            color: Color.fromRGBO(237, 189, 58, 1),
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

  Future<Widget> vehicleBox(
    BuildContext context,
    CarModel car,
  ) async {
    ServicesProvider servicesProvider = Provider.of(context);

    await servicesProvider.loadCarsize(context);

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
                    Text(
                      car.brand,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                            padding: const EdgeInsets.only(top: 10),
                            visualDensity: const VisualDensity(
                              horizontal: VisualDensity.minimumDensity,
                              vertical: VisualDensity.minimumDensity,
                            ),
                            splashRadius: 26,
                            iconSize: 26,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      VehiclesEditPage(preData: car),
                                ),
                              );
                            },
                            icon: const Icon(Icons.edit_outlined)),
                        IconButton(
                            padding: const EdgeInsets.only(top: 10),
                            visualDensity: const VisualDensity(
                              horizontal: VisualDensity.minimumDensity,
                              vertical: VisualDensity.minimumDensity,
                            ),
                            splashRadius: 26,
                            iconSize: 26,
                            onPressed: () {},
                            icon: const Icon(Icons.delete_outline)),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  car.model,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  car.color,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  car.plate,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  servicesProvider.getCarsizeComplete(car.car_size_id).title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
