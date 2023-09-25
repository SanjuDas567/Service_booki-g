import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:glossy_flossy/models/user/form_data/commercial_booking_response.dart';
import 'package:glossy_flossy/models/user/service_type_model.dart';
import 'package:glossy_flossy/provider/user/commercial_providder.dart';
import 'package:glossy_flossy/provider/user/login_provider_user.dart';
import 'package:glossy_flossy/screen/user/commercial_booking/widgets/check_box_design.dart';
import 'package:glossy_flossy/utils/color_resources.dart';
import 'package:glossy_flossy/utils/custom_fonts.dart';
import 'package:glossy_flossy/utils/images.dart';
import 'package:glossy_flossy/widgets/custom_text_form_field.dart';
import 'package:provider/provider.dart';

class CommercialBooking extends StatefulWidget {
  ServiceData data;
  CommercialBooking({required this.data});

  @override
  State<CommercialBooking> createState() => _CommercialBookingState();
}

class _CommercialBookingState extends State<CommercialBooking> {
  late CommercialBookingProvider commercialProvider;

  DateTime selectedDate = DateTime.now().add(Duration(days: 1));

  String? formateddate;

  final _controller = ScrollController();

  final _locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      commercialProvider =
          Provider.of<CommercialBookingProvider>(context, listen: false);
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
      commercialProvider.removeTime();
      commercialProvider.clearCommercialTotalAmt();

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
                Images.COMMERCIAL_BOOKING_IMAGE_1,
                fit: BoxFit.cover,
              ),
              title: const Text(
                'Commercial Cleaning Booking',
                style: TextStyle(
                  fontSize: 18,
                  // color: Colors.yellow,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Consumer<CommercialBookingProvider>(
            builder: (context, commercialProvider, child) {
              return commercialProvider.isLoading
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
                        CheckBoxCommercial(),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                          controller: commercialProvider.servicetime,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              labelText: "Service time",
                              hintStyle: TextStyle(
                                  color: ColorResources.GLOSSY_FLOSSY_YELLOW),
                              labelStyle: const TextStyle(
                                  color: ColorResources.GLOSSY_FLOSSY_YELLOW),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18),
                                borderSide:
                                    const BorderSide(color: Colors.yellow),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(18),
                                  borderSide:
                                      const BorderSide(color: Colors.yellow))),
                          readOnly: true,
                          onTap: () => commercialProvider.selectTime(context),
                        ),
                        Column(children: [
                          SizedBox(
                            height: 20,
                          ),
                          AppTextFormField(
                            controller: _locationController,
                            hintText: 'Service Location',
                            textInputType: TextInputType.text,
                            regExp: r'^[a-zA-Z ]+$',
                          ),
                        ]),
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
                              Text(commercialProvider.commercialTotalAmount.toString(),style: poppinsRegular.copyWith(
                                color: ColorResources.GLOSSY_FLOSSY_WHITE,
                                fontSize: 18
                              ),),
                            ],
                          ),
                          SizedBox(
                                height: 10,
                              ),
                        commercialProvider.isBookingLoading
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
                                        border:
                                            Border.all(color: Colors.yellow),
                                        color:
                                            ColorResources.GLOSSY_FLOSSY_YELLOW,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Book wash',
                                          style: TextStyle(
                                              color: ColorResources
                                                  .GLOSSY_FLOSSY_BLACK),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                      ],
                    );
            },
          )),
        ],
      ),
    );
  }

  void bookService(BuildContext context) async {
    final commercialProvider =
        Provider.of<CommercialBookingProvider>(context, listen: false);
    final userID =
        Provider.of<AuthProvider>(context, listen: false).getUserId();
    print(userID);


    String location = _locationController.text.trim();
     String serviceTime = commercialProvider.servicetime.text.trim();
    
    List serviceNameSl = [];

    if (commercialProvider.checkbox1) serviceNameSl.add(commercialProvider.commercialServiceTypeModel!.data[0].nameSlno);
    if (commercialProvider.checkbox2) serviceNameSl.add(commercialProvider.commercialServiceTypeModel!.data[1].nameSlno);
    if (commercialProvider.checkbox3) serviceNameSl.add(commercialProvider.commercialServiceTypeModel!.data[2].nameSlno);
    if (commercialProvider.checkbox4) serviceNameSl.add(commercialProvider.commercialServiceTypeModel!.data[3].nameSlno);
    if (commercialProvider.checkbox5) serviceNameSl.add(commercialProvider.commercialServiceTypeModel!.data[4].nameSlno);
    if (commercialProvider.checkbox6) serviceNameSl.add(commercialProvider.commercialServiceTypeModel!.data[5].nameSlno);
    print(serviceNameSl);
    CommercialBookingModel commercialBookingModel = CommercialBookingModel();
    commercialBookingModel.serNameSlno = serviceNameSl;
    commercialBookingModel.userId = userID;
    commercialBookingModel.servTypeSlno = 3;
    commercialBookingModel.servTime = serviceTime;
    commercialBookingModel.servDate = formateddate;
    commercialBookingModel.servLocation = location;
    commercialBookingModel.vehicleId = '';
    commercialBookingModel.vehicleName = '';
    commercialBookingModel.servImageSofa = commercialProvider.sofaValetImages;
    commercialBookingModel.servImageStain =
        commercialProvider.stainRemovalImages;
    commercialBookingModel.servImageCarpet =
        commercialProvider.carpetCleanImages;
    commercialBookingModel.servImageWindow =
        commercialProvider.windowCleaningImages;
    commercialBookingModel.servImageGutter =
        commercialProvider.guteringCleaningImages;
    commercialBookingModel.servImageDriveway =
        commercialProvider.drivewayImages;

        if(serviceNameSl.isNotEmpty) {
          await commercialProvider.houseKeepBooking(
        commercialBookingModel, route, context);
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
