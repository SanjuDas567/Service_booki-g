import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paypal/flutter_paypal.dart';
import 'package:glossy_flossy/models/user/form_data/vehicle_service_booking.dart';
import 'package:glossy_flossy/models/user/service_type_model.dart';
import 'package:glossy_flossy/provider/user/login_provider_user.dart';
import 'package:glossy_flossy/provider/user/vehicle_booking_provider.dart';
import 'package:glossy_flossy/screen/common/payment_confirm_screen/payment_confirm_screen.dart';
import 'package:glossy_flossy/screen/user/vehicle_wash_booking/widgets/service_selection_check_box.dart';
import 'package:glossy_flossy/services/paypal_payment.dart';
import 'package:glossy_flossy/utils/app_constants.dart';
import 'package:glossy_flossy/utils/color_resources.dart';
import 'package:glossy_flossy/utils/custom_fonts.dart';
import 'package:glossy_flossy/utils/images.dart';
import 'package:glossy_flossy/widgets/custom_page_route.dart';
import 'package:glossy_flossy/widgets/custom_text_form_field.dart';
import 'package:provider/provider.dart';

class VehicleWashBooking extends StatefulWidget {
  ServiceData data;
  VehicleWashBooking({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<VehicleWashBooking> createState() => _VehicleWashBookingState();
}

class _VehicleWashBookingState extends State<VehicleWashBooking> {
  final _controller = ScrollController();

  DateTime selectedDate = DateTime.now().add(Duration(days: 1));

  String? formateddate;

  final _locationController = TextEditingController();
  final _vehicleRegController = TextEditingController();
  final _vehicleNameControlller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  late VehicleBookingProvider vehicleProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      vehicleProvider =
          Provider.of<VehicleBookingProvider>(context, listen: false);

      vehicleProvider.getServiceName(widget.data.typeSlno.toString());
    });
    print(widget.data.typeSlno);
  }

  @override
  void dispose() {
    print('inside dispose vehicle booking');
    vehicleProvider.updateCheckbox1(false);
    vehicleProvider.updateCheckbox2(false);
    vehicleProvider.updateCheckbox3(false);
    vehicleProvider.updateCheckbox4(false);
    vehicleProvider.updateCheckbox5(false);
    vehicleProvider.removeTime();
    vehicleProvider.clearTotalAmount();
    // TODO: implement dispose
    super.dispose();
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
                Images.CAR_WASHING,
                fit: BoxFit.cover,
              ),
              title: Text(
                'Vehicle Wash Booking',
                style: TextStyle(
                  fontSize: 18,
                  // color: Colors.yellow,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Consumer<VehicleBookingProvider>(
              builder: (context, vehicleProvider, child) {
                return vehicleProvider.isLoading
                    ? Center(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            CircularProgressIndicator(
                              color: ColorResources.GLOSSY_FLOSSY_YELLOW,
                            ),
                          ],
                        ),
                      )
                    : Column(
                        children: [
                          CalendarTimeline(
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: selectedDate,
                            onDateSelected: (date) {
                              print(date.toLocal());
                              formateddate =
                                  "${date.year}-${date.month}-${date.day}";
                              print(formateddate);
                            },
                            leftMargin: 20,
                            monthColor: Colors.blueGrey,
                            dayColor: Colors.teal[200],
                            activeDayColor: Colors.black,
                            activeBackgroundDayColor: Colors.yellow,
                            dotsColor: Color(0xFF333A47),
                            selectableDayPredicate: (date) => date.day != 23,
                            locale: 'en_ISO',
                          ),
                          CheckBoxVehicle(),
                          SizedBox(
                            height: 30,
                          ),
                          Column(
                            children: [
                              TextField(
                                controller: vehicleProvider.servicetime,
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
                                    vehicleProvider.selectTime(context),
                              ),
                              Form(
                                  key: _formKey,
                                  child: Column(
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
                                      SizedBox(
                                        height: 20,
                                      ),
                                      AppTextFormField(
                                        controller: _vehicleRegController,
                                        hintText: 'Vehicle Number',
                                        textInputType: TextInputType.text,
                                        regExp: r'^[a-zA-Z0-9\s\.,\-]+$',
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      AppTextFormField(
                                        controller: _vehicleNameControlller,
                                        hintText: 'Vehicle Model',
                                        textInputType: TextInputType.text,
                                        regExp: r'^[a-zA-Z ]+$',
                                      ),
                                    ],
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total Amount',
                                style: poppinsRegular.copyWith(
                                    color: ColorResources.GLOSSY_FLOSSY_WHITE,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                vehicleProvider.totalAmount.toString(),
                                style: poppinsRegular.copyWith(
                                    color: ColorResources.GLOSSY_FLOSSY_WHITE,
                                    fontSize: 18),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          vehicleProvider.vehicleBookingLoading
                              ? Center(
                                  child: CircularProgressIndicator(
                                    color: ColorResources.GLOSSY_FLOSSY_YELLOW,
                                  ),
                                )
                              : InkWell(
                                  onTap: () {
                                                Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (BuildContext context) => PaypalPayment(amount: vehicleProvider.totalAmount,)
                                    ),
                                                );
                                    Navigator.push(
                                      context,
                                      CustomDownPageRoute(
                                          child: PaymentConfirmScreen(
                                              amount:
                                                  vehicleProvider.totalAmount),
                                          direction: AxisDirection.up),
                                    );
                                    // bookVehicleService();
                                  },
                                  child: Container(
                                    height: 40,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.yellow),
                                      color:
                                          ColorResources.GLOSSY_FLOSSY_YELLOW,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: const Center(
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
                      );
              },
            ),
          ),
        ],
      ),
    );
  }

  void bookVehicleService() async {
    final vehicleProvider =
        Provider.of<VehicleBookingProvider>(context, listen: false);

    final userID =
        Provider.of<AuthProvider>(context, listen: false).getUserId();

    String location = _locationController.text.trim();
    String vehicleReg = _vehicleRegController.text.trim();
    String vehicleName = _vehicleNameControlller.text.trim();
    String serviceTime = vehicleProvider.servicetime.text.trim();
    print(serviceTime);
    List serviceNameSl = [];

    if (vehicleProvider.checkbox1) serviceNameSl.add(1);
    if (vehicleProvider.checkbox2) serviceNameSl.add(2);
    if (vehicleProvider.checkbox3) serviceNameSl.add(3);
    if (vehicleProvider.checkbox4) serviceNameSl.add(4);
    if (vehicleProvider.checkbox5) serviceNameSl.add(5);
    print(serviceNameSl);
    VehicleServiceBookingModel vehicleServiceBookingModel =
        VehicleServiceBookingModel();
    vehicleServiceBookingModel.serNameSlno = serviceNameSl;
    vehicleServiceBookingModel.userId = userID;
    vehicleServiceBookingModel.servTypeSlno = 1;
    vehicleServiceBookingModel.servTime = serviceTime;
    vehicleServiceBookingModel.servDate = formateddate;
    vehicleServiceBookingModel.servLocation = location;
    vehicleServiceBookingModel.vehicleId = vehicleReg;
    vehicleServiceBookingModel.vehicleName = vehicleName;
    vehicleServiceBookingModel.servImageSofa = [];
    vehicleServiceBookingModel.servImageStain = [];
    vehicleServiceBookingModel.servImageCarpet = [];
    vehicleServiceBookingModel.servImageWindow = [];
    vehicleServiceBookingModel.servImageGutter = [];
    vehicleServiceBookingModel.servImageDriveway = [];
    if (serviceNameSl.isNotEmpty) {
      print('inside if vehicle booking api');
      await vehicleProvider.vehicleWashBooking(
          vehicleServiceBookingModel, route);
    } else {
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
