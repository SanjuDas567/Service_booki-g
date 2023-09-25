import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:glossy_flossy/models/user/form_data/house_keeping_booking_response.dart';
import 'package:glossy_flossy/models/user/service_type_model.dart';
import 'package:glossy_flossy/provider/user/house_keeping_provider.dart';
import 'package:glossy_flossy/provider/user/login_provider_user.dart';
import 'package:glossy_flossy/screen/user/housekeeping_booking/widgets/check_box.dart';
import 'package:glossy_flossy/utils/color_resources.dart';
import 'package:glossy_flossy/utils/custom_fonts.dart';
import 'package:glossy_flossy/utils/images.dart';
import 'package:glossy_flossy/widgets/custom_text_form_field.dart';
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

  DateTime selectedDate = DateTime.now().add(Duration(days: 1));
  String? formateddate;


  final _controller = ScrollController();
    final _locationController = TextEditingController();

  late HouseKeepingProvider houseKeepingProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
       houseKeepingProvider =
          Provider.of<HouseKeepingProvider>(context, listen: false);
      houseKeepingProvider.updateCheckbox1(false);
      houseKeepingProvider.updateCheckbox2(false);
      houseKeepingProvider.updateCheckbox3(false);
      houseKeepingProvider.updateCheckbox4(false);
      houseKeepingProvider.updateCheckbox5(false);
      houseKeepingProvider.updateCheckbox6(false);
      
      houseKeepingProvider.getServiceName(widget.data.typeSlno.toString());
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
          houseKeepingProvider.updateCheckbox1(false);
          houseKeepingProvider.updateCheckbox2(false);
          houseKeepingProvider.updateCheckbox3(false);
          houseKeepingProvider.updateCheckbox4(false);
          houseKeepingProvider.updateCheckbox5(false);
          houseKeepingProvider.updateCheckbox6(false);
          houseKeepingProvider.clearSofaValetImage();
          houseKeepingProvider.clearcarpetImages();
          houseKeepingProvider.clearStainImages();
          houseKeepingProvider.clearWindowImages();
          houseKeepingProvider.clearGuteringCleaningImages();
          houseKeepingProvider.clearDrivewayImages();
          houseKeepingProvider.removeTime();
          houseKeepingProvider.clearHouseTotalAmt();
  }

  @override
  Widget build(BuildContext context) {
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
            child: Consumer<HouseKeepingProvider>(
              builder: (context, houseKeepingProvider, child) {
                return houseKeepingProvider.isLoading
                ? Center(
                  child: CircularProgressIndicator(
                    color: ColorResources.GLOSSY_FLOSSY_YELLOW,
                  ),
                ) 
                : Column(
                children: [
                  CalendarTimeline(
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: selectedDate,
                    onDateSelected: (date) {
                      formateddate = 
                      "${date.year}-${date.month}-${date.day}";
                    },
                    leftMargin: 20,
                    monthColor: Colors.blueGrey,
                    dayColor: Colors.white,
                    activeDayColor: Colors.black,
                    activeBackgroundDayColor: Colors.yellow,
                    dotsColor: const Color(0xFF333A47),
                    selectableDayPredicate: (date) => date.day != 23,
                    locale: 'en_ISO',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Choose service you need',
                      style: TextStyle(color: Colors.yellow)),
                  HouseKeepingCheckBox(),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                                controller: houseKeepingProvider.servicetime,
                                style: const TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                    labelText: "Service time",
                                    hintStyle: TextStyle(
                                        color: ColorResources
                                            .GLOSSY_FLOSSY_YELLOW),
                                    labelStyle: const TextStyle(
                                        color: ColorResources
                                            .GLOSSY_FLOSSY_YELLOW),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(18),
                                      borderSide: const BorderSide(
                                          color: Colors.yellow),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(18),
                                        borderSide: const BorderSide(
                                            color: Colors.yellow))),
                                readOnly: true,
                                onTap: () =>
                                    houseKeepingProvider.selectTime(context),
                              ),
                              Column(
                                    children: [
                                      SizedBox(
                                        height: 20,
                                      ),
                                      AppTextFormField(
                                        controller: _locationController,
                                        hintText: 'Service Location',
                                        textInputType: TextInputType.text,
                                        regExp: r'^[a-zA-Z ]+$',
                                      ),
                                    ]
                              ),
                              SizedBox(
                                height: 10,
                              ),
                               Row(
                            mainAxisAlignment: 
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total Amount',
                                style: poppinsRegular.copyWith(
                                    color: ColorResources.GLOSSY_FLOSSY_WHITE,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(houseKeepingProvider.houseTotalAmount.toString(),style: poppinsRegular.copyWith(
                                color: ColorResources.GLOSSY_FLOSSY_WHITE,
                                fontSize: 18
                              ),),
                            ],
                          ),
                          SizedBox(
                                height: 10,
                              ),
                  houseKeepingProvider.isBookingLoading
                      ? Center(
                          child: CircularProgressIndicator(
                            color: ColorResources.GLOSSY_FLOSSY_YELLOW,
                          ),
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
                                  color: ColorResources.GLOSSY_FLOSSY_YELLOW,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Center(
                                  child: Text(
                                    'Book wash',
                                    style: TextStyle(color: ColorResources.GLOSSY_FLOSSY_BLACK),
                                  ),
                                ),
                              ),
                            ),
                          ],
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


    String location = _locationController.text.trim();
     String serviceTime = houseKeepingProvider.servicetime.text.trim();
    
    List serviceNameSl = [];

    if (houseKeepingProvider.checkbox1) serviceNameSl.add(houseKeepingProvider.houseServiceTypeModel!.data[0].nameSlno);
    if (houseKeepingProvider.checkbox2) serviceNameSl.add(houseKeepingProvider.houseServiceTypeModel!.data[1].nameSlno);
    if (houseKeepingProvider.checkbox3) serviceNameSl.add(houseKeepingProvider.houseServiceTypeModel!.data[2].nameSlno);
    if (houseKeepingProvider.checkbox4) serviceNameSl.add(houseKeepingProvider.houseServiceTypeModel!.data[3].nameSlno);
    if (houseKeepingProvider.checkbox5) serviceNameSl.add(houseKeepingProvider.houseServiceTypeModel!.data[4].nameSlno);
    if (houseKeepingProvider.checkbox6) serviceNameSl.add(houseKeepingProvider.houseServiceTypeModel!.data[5].nameSlno);
    print(serviceNameSl);
    HouseKeepBookingModel houseKeepBookingModel = HouseKeepBookingModel();
    houseKeepBookingModel.serNameSlno = serviceNameSl;
    houseKeepBookingModel.userId = userID;
    houseKeepBookingModel.servTypeSlno = 2;
    houseKeepBookingModel.servTime = serviceTime;
    houseKeepBookingModel.servDate = formateddate;
    houseKeepBookingModel.servLocation = location;
    houseKeepBookingModel.vehicleId = '';
    houseKeepBookingModel.vehicleName = '';
    houseKeepBookingModel.servImageSofa = houseKeepingProvider.sofaValetImages;
    houseKeepBookingModel.servImageStain =
        houseKeepingProvider.stainRemovalImages;
    houseKeepBookingModel.servImageCarpet =
        houseKeepingProvider.carpetCleanImages;
    houseKeepBookingModel.servImageWindow =
        houseKeepingProvider.windowCleaningImages;
    houseKeepBookingModel.servImageGutter =
        houseKeepingProvider.guteringCleaningImages;
    houseKeepBookingModel.servImageDriveway =
        houseKeepingProvider.drivewayImages;

        if(serviceNameSl.isNotEmpty) {
          await houseKeepingProvider.houseKeepBooking(
        houseKeepBookingModel, route, context);
        }else {
          print('inside else vehicle booking scaffold');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        behavior: SnackBarBehavior.fixed,
        content: Text('select any service to continue'),
        backgroundColor: ColorResources.SNACKBAR_RED,
      ));
        }
    
  }

  route(bool isRoute, String errorMessage) async {
    print('inside route');
    print(errorMessage);

    if (isRoute) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(errorMessage),
        backgroundColor: Colors.green,
      ));
      Navigator.of(context).pop();
    }
  }
}
