import 'package:flutter/material.dart';
import 'package:glossy_flossy/provider/user/home_screen_provider.dart';
import 'package:glossy_flossy/screen/user/commercial_booking/commercial_booking.dart';
import 'package:glossy_flossy/screen/user/home_screen.dart/widgets/image_slider.dart';
import 'package:glossy_flossy/screen/user/home_screen.dart/widgets/location_container.dart';
import 'package:glossy_flossy/screen/user/home_screen.dart/widgets/service_type_widget.dart';
import 'package:glossy_flossy/screen/user/housekeeping_booking/house_keeping_booking.dart';
import 'package:glossy_flossy/screen/user/vehicle_wash_booking/vehicle_wash_booking.dart';
import 'package:glossy_flossy/utils/images.dart';
import 'package:glossy_flossy/widgets/custom_page_route.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<HomeScreenProvider>(context, listen: false).getServiceType();
    });
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: CustomScrollView(
          shrinkWrap: true,
          slivers: [
            // CustomAppBar(
            //   isBackButton: 0,
            //   isNotification: 0,
            // ),
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
                    Consumer<HomeScreenProvider>(
                      builder: (context, homeScreenProvider, child) {
                        // ServiceTypeModel? serviceType =
                        //     homeScreenProvider.serviceTypeModel;
                        return homeScreenProvider.isLoading
                            ? Center(
                                child: CircularProgressIndicator(
                                  color: Colors.yellow,
                                ),
                              )
                            : SizedBox(
                                height: 150,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    CategoryCardMallika1(
                                      title: homeScreenProvider
                                          .serviceTypeModel!.data[0].serviceType
                                          .capitalizeFirstLetter(),
                                      image: Images.CAR_WASHING_IMAGE,
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          CustomDownPageRoute(
                                              child: VehicleWashBooking(
                                                data: homeScreenProvider
                                                    .serviceTypeModel!.data[0],
                                              ),
                                              direction: AxisDirection.up),
                                        );
                                      },
                                    ),
                                    CategoryCardMallika1(
                                        title: homeScreenProvider
                                            .serviceTypeModel!
                                            .data[1]
                                            .serviceType
                                            .capitalizeFirstLetter(),
                                        image: Images.HOME_CLEANING_IMAGES,
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  HouseKeepingBookingScreen(
                                                data: homeScreenProvider
                                                    .serviceTypeModel!.data[1],
                                              ),
                                            ),
                                          );
                                        }),
                                    CategoryCardMallika1(
                                        title: homeScreenProvider
                                            .serviceTypeModel!
                                            .data[2]
                                            .serviceType
                                            .capitalizeFirstLetter(),
                                        image:
                                            Images.COMMERCIAL_CLEANING_IMAGES,
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  CommercialBooking(
                                                data: homeScreenProvider
                                                    .serviceTypeModel!.data[2],
                                              ),
                                            ),
                                          );
                                        }),
                                  ],
                                ),
                              );
                      },
                    ),
                    const Column(
                      children: [
                        Text(
                          'Service',
                          style: TextStyle(color: Colors.yellow),
                        ),
                        SizedBox(
                          height: 20,
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



// Row(
                        //     mainAxisAlignment:
                        //         MainAxisAlignment.spaceEvenly,
                        //     children: [
                        //       // vehicle booking :--------------------------
                        //       Expanded(
                        //         child: Padding(
                        //           padding: const EdgeInsets.all(8.0),
                        //           child: Column(
                        //             children: [
                        //               InkWell(
                        //                 onTap: () {
                        //                   Navigator.push(
                        //                     context,
                        //                     MaterialPageRoute(
                        //                       builder: (context) =>
                        //                           VehicleWashBooking(
                        //                         data: serviceType!.data[0],
                        //                       ),
                        //                     ),
                        //                   );
                        //                 },
                        //                 child: Container(
                        //                   width: MediaQuery.of(context)
                        //                           .size
                        //                           .width *
                        //                       0.18,
                        //                   height: MediaQuery.of(context)
                        //                           .size
                        //                           .height *
                        //                       0.08,
                        //                   decoration: BoxDecoration(
                        //                     color: Colors.white
                        //                         .withOpacity(.2),
                        //                     borderRadius:
                        //                         BorderRadius.circular(15),
                        //                     border: Border.all(
                        //                         color: Colors.yellow),
                        //                   ),
                        //                   child: ClipRRect(
                        //                     borderRadius:
                        //                         BorderRadius.circular(15),
                        //                     child: Image.asset(
                        //                       Images.CAR_WASHING_IMAGE,
                        //                       fit: BoxFit.cover,
                        //                     ),
                        //                   ),
                        //                 ),
                        //               ),
                        //               SizedBox(
                        //                 height: 10,
                        //               ),
                        //               Text(
                        //                 serviceType!.data[0].serviceType
                        //                     .capitalizeFirstLetter(),
                        //                 style:
                        //                     TextStyle(color: Colors.white),
                        //               ),
                        //             ],
                        //           ),
                        //         ),
                        //       ),
                        //       // House cleaning booking :-------------------
                        //       Expanded(
                        //         child: Padding(
                        //           padding: const EdgeInsets.all(8.0),
                        //           child: Column(
                        //             children: [
                        //               InkWell(
                        //                 onTap: () {
                        //                   Navigator.push(
                        //                     context,
                        //                     MaterialPageRoute(
                        //                       builder: (context) =>
                        //                           HouseKeepingBookingScreen(
                        //                         data: serviceType.data[1],
                        //                       ),
                        //                     ),
                        //                   );
                        //                 },
                        //                 child: Container(
                        //                   width: MediaQuery.of(context)
                        //                           .size
                        //                           .width *
                        //                       0.18,
                        //                   height: MediaQuery.of(context)
                        //                           .size
                        //                           .height *
                        //                       0.08,
                        //                   decoration: BoxDecoration(
                        //                     color: Colors.white
                        //                         .withOpacity(.2),
                        //                     borderRadius:
                        //                         BorderRadius.circular(15),
                        //                     border: Border.all(
                        //                         color: Colors.yellow),
                        //                   ),
                        //                   child: ClipRRect(
                        //                     borderRadius:
                        //                         BorderRadius.circular(15),
                        //                     child: Image.asset(
                        //                       Images.HOME_CLEANING_IMAGES,
                        //                       fit: BoxFit.cover,
                        //                     ),
                        //                   ),
                        //                 ),
                        //               ),
                        //               SizedBox(
                        //                 height: 10,
                        //               ),
                        //               Text(
                        //                 serviceType.data[1].serviceType
                        //                     .capitalizeFirstLetter(),
                        //                 textAlign: TextAlign.center,
                        //                 style:
                        //                     TextStyle(color: Colors.white),
                        //               )
                        //             ],
                        //           ),
                        //         ),
                        //       ),
                        //       // Commercial booking :-----------------------
                        //       Expanded(
                        //         child: Padding(
                        //           padding: const EdgeInsets.all(8.0),
                        //           child: Column(
                        //             children: [
                        //               InkWell(
                        //                 onTap: () {
                        //                   Navigator.push(
                        //                     context,
                        //                     MaterialPageRoute(
                        //                       builder: (context) =>
                        //                           CommercialBooking(
                        //                         data: serviceType.data[2],
                        //                       ),
                        //                     ),
                        //                   );
                        //                 },
                        //                 child: Container(
                        //                   width: MediaQuery.of(context)
                        //                           .size
                        //                           .width *
                        //                       0.18,
                        //                   height: MediaQuery.of(context)
                        //                           .size
                        //                           .height *
                        //                       0.08,
                        //                   decoration: BoxDecoration(
                        //                     color: Colors.white
                        //                         .withOpacity(.2),
                        //                     borderRadius:
                        //                         BorderRadius.circular(15),
                        //                     border: Border.all(
                        //                         color: Colors.yellow),
                        //                   ),
                        //                   child: ClipRRect(
                        //                     borderRadius:
                        //                         BorderRadius.circular(15),
                        //                     child: Image.asset(
                        //                       Images
                        //                           .COMMERCIAL_CLEANING_IMAGES,
                        //                       fit: BoxFit.cover,
                        //                     ),
                        //                   ),
                        //                 ),
                        //               ),
                        //               SizedBox(
                        //                 height: 10,
                        //               ),
                        //               Text(
                        //                 serviceType.data[2].serviceType
                        //                     .capitalizeFirstLetter(),
                        //                 textAlign: TextAlign.center,
                        //                 style: TextStyle(
                        //                   color: Colors.white,
                        //                 ),
                        //               )
                        //             ],
                        //           ),
                        //         ),
                        //       ),
                        //     ],
                        //   );