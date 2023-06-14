import 'package:flutter/material.dart';
import 'package:glossy_flossy/screen/home_screen.dart/widgets/image_slider.dart';
import 'package:glossy_flossy/screen/home_screen.dart/widgets/location_container.dart';
import 'package:glossy_flossy/screen/housekeeping_booking/house_keeping_booking.dart';
import 'package:glossy_flossy/screen/vehicle_wash_booking/vehicle_wash_booking.dart';
import 'package:glossy_flossy/widgets/custom_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      drawer: Drawer(
        backgroundColor: Colors.black,
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.yellow),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: Text(
                'Item 1',
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              title: Text(
                'Item 2',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(
          shrinkWrap: true,
          slivers: [
            CustomAppBar(
              isBackButton: 0,
              isNotification: 0,
            ),
            SliverToBoxAdapter(
              child: PictureSlideShow(),
            ),
            const SliverToBoxAdapter(
              child: LocationWidget(),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Service Type',
                      style: TextStyle(color: Colors.yellow),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          VehicleWashBooking(),
                                    ),
                                  );
                                },
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.18,
                                  height:
                                      MediaQuery.of(context).size.height * 0.08,
                                  decoration: BoxDecoration(
                                    color: Colors.white54,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: const Icon(Icons.wash_outlined),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Vehicle Wash',
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            HouseKeepingBookingScreen()),
                                  );
                                },
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.18,
                                  height:
                                      MediaQuery.of(context).size.height * 0.08,
                                  decoration: BoxDecoration(
                                    color: Colors.white54,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: const Icon(Icons.wash_outlined),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Housekeeping',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Column(
                      children: [
                        Text(
                          'Service',
                          style: TextStyle(color: Colors.yellow),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
