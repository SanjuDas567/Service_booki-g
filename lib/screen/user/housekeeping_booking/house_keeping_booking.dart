import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:glossy_flossy/models/user/form_data/house_keeping_booking_response.dart';
import 'package:glossy_flossy/models/user/service_type_model.dart';
import 'package:glossy_flossy/provider/user/house_keeping_provider.dart';
import 'package:glossy_flossy/provider/user/login_provider_user.dart';
import 'package:glossy_flossy/screen/user/housekeeping_booking/widgets/check_box.dart';
import 'package:glossy_flossy/utils/color_resources.dart';
import 'package:glossy_flossy/utils/images.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class HouseKeepingBookingScreen extends StatefulWidget {
  ServiceData data;
  HouseKeepingBookingScreen({required this.data});

  @override
  State<HouseKeepingBookingScreen> createState() =>
      _HouseKeepingBookingScreenState();
}

class _HouseKeepingBookingScreenState extends State<HouseKeepingBookingScreen> {
  bool isChecked = false;

  bool isCheckBoxChecked = false;

  void toggleCheckbox() {
    isChecked = !isChecked;
  }

  final _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final commercialProvider =
          Provider.of<HouseKeepingProvider>(context, listen: false);
      commercialProvider.updateCheckbox1(false);
      commercialProvider.updateCheckbox2(false);
      commercialProvider.updateCheckbox3(false);
      commercialProvider.updateCheckbox4(false);
      commercialProvider.updateCheckbox5(false);
      commercialProvider.updateCheckbox6(false);
      commercialProvider.clearSofaValetImage();
      commercialProvider.clearcarpetImages();
      commercialProvider.clearStainImages();
      commercialProvider.clearWindowImages();
      commercialProvider.clearGuteringCleaningImages();
      commercialProvider.clearDrivewayImages();

      commercialProvider.getServiceName(widget.data.typeSlno.toString());
    });
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        controller: _controller,
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.black,
            expandedHeight: 200,
            floating: true,
            pinned: true,
            snap: false,
            // title: Text(
            //   'Vehicle Wash Booking',
            //   style: TextStyle(color: Colors.yellow),
            // ),
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                Images.CARPET_CLEANING,
                fit: BoxFit.cover,
              ),
              title: const Text(
                'House Cleaning Booking',
                style: TextStyle(
                  fontSize: 18,
                  // color: Colors.yellow,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: CalendarTimeline(
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime(2050, 11, 20),
              onDateSelected: (date) => print(date),
              leftMargin: 20,
              monthColor: Colors.blueGrey,
              dayColor: Colors.white,
              activeDayColor: Colors.black,
              activeBackgroundDayColor: Colors.yellow,
              dotsColor: const Color(0xFF333A47),
              selectableDayPredicate: (date) => date.day != 23,
              locale: 'en_ISO',
            ),
          ),
          const SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text('Choose service you need',
                    style: TextStyle(color: Colors.yellow)),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: HouseKeepingCheckBox(),
          ),
          SliverToBoxAdapter(
            child: Consumer<HouseKeepingProvider>(
              builder: (context, houseKeepingProvider, child) {
                return houseKeepingProvider.isBookingLoading
                    ? CircularProgressIndicator(
                        color: ColorResources.GLOSSY_FLOSSY_YELLOW,
                      )
                    : Column(
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          InkWell(
                            onTap: () {
                              bookService(context);
                            },
                            child: Container(
                              height: 40,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.yellow),
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Center(
                                child: Text(
                                  'Book wash',
                                  style: TextStyle(color: Colors.yellow),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
              },
            ),
          ),
        ],
      ),
    );
  }

  void bookService(BuildContext context) async {
    final houseKeepingProvider =
        Provider.of<HouseKeepingProvider>(context, listen: false);
    final userID =
        Provider.of<AuthProvider>(context, listen: false).getUserId();
    print(userID);
    // print(houseKeepingProvider.sofaValetImages[0].uri);
    HouseKeepBookingModel houseKeepBookingModel = HouseKeepBookingModel();
    houseKeepBookingModel.serNameSlno = 1;
    houseKeepBookingModel.userId = userID;
    houseKeepBookingModel.servTypeSlno = "2";
    houseKeepBookingModel.servTime = "01:00:00";
    houseKeepBookingModel.servDate = "2023-08-23";
    houseKeepBookingModel.servLocation = "london";
    houseKeepBookingModel.vehicleId = null;
    houseKeepBookingModel.vehicleName = null;
    houseKeepBookingModel.servImageSofa = houseKeepingProvider.sofaValetImages;
    houseKeepBookingModel.servImageStain = null;
    houseKeepBookingModel.servImageCarpet = null;
    houseKeepBookingModel.servImageWindow = null;
    houseKeepBookingModel.servImageGutter = null;
    houseKeepBookingModel.servImageDriveway = null;
    await houseKeepingProvider.houseKeepBooking(
        houseKeepBookingModel, route, context);
  }

  route(bool isRoute, String errorMessage) async {
    print('inside route');
    print(errorMessage);

    if (isRoute) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(errorMessage),
        backgroundColor: Colors.green,
      ));
    }
  }
}
