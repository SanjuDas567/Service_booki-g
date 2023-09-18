import 'package:flutter/material.dart';
import 'package:glossy_flossy/models/user/form_data/otp_mobile_form_data.dart';
import 'package:glossy_flossy/provider/worker/register_screen_provider_worker.dart';
import 'package:glossy_flossy/screen/user/otp_screen/widgets/otp_text_field.dart';
import 'package:glossy_flossy/utils/color_resources.dart';
import 'package:glossy_flossy/utils/custom_fonts.dart';
import 'package:glossy_flossy/utils/dimentions.dart';
import 'package:glossy_flossy/utils/images.dart';
import 'package:glossy_flossy/widgets/show_custom_modal_dialog.dart';
import 'package:provider/provider.dart';

class WorkerOtpScreen extends StatefulWidget {
  final String number;
  const WorkerOtpScreen({super.key, required this.number});

  @override
  State<WorkerOtpScreen> createState() => _WorkerOtpScreenState();
}

class _WorkerOtpScreenState extends State<WorkerOtpScreen> {

  late RegisterWorkerProvider registerProvider;

  final TextEditingController _otp1 = TextEditingController();
  final TextEditingController _otp2 = TextEditingController();
  final TextEditingController _otp3 = TextEditingController();
  final TextEditingController _otp4 = TextEditingController();
  final TextEditingController _otp5 = TextEditingController();
  final TextEditingController _otp6 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.GLOSSY_FLOSSY_BLACK,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Consumer<RegisterWorkerProvider>(
                builder: (context, registerWorkerProvider, child) {
                  return Padding(
                    padding: const EdgeInsets.all(Dimensions.MARGIN_SIZE_EXTRA_SMALL),
                    child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 21,
                            ),
                            Image.asset(Images.GLOSSY_FLOSSY_LOGO),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 21,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 21,
                            ),
                            Text(
                              'Please type the verificatiion code \nsent to ${widget.number}',
                              textAlign: TextAlign.center,
                              style: poppinsRegular.copyWith(
                                  color: ColorResources.GLOSSY_FLOSSY_WHITE,
                                  fontSize: 16),
                            ),
                            TextButton(
                              onPressed: () {
                                showCustomModalDialog(
                                  context: context,
                                  content: 'Need to change phone number',
                                  submitButtonText: 'Submit',
                                  cancelButtonText: 'cancel',
                                  title: 'Message',
                                  cancelOnPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  submitOnPressed: () {
                                    Navigator.of(context)
                                      ..pop()
                                      ..pop();
                                  },
                                );
                              },
                              child: Text('Edit phone number'),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 21,
                            ),
                            OtptextField(
                              otp1: _otp1,
                              otp2: _otp2,
                              otp3: _otp3,
                              otp4: _otp4,
                              otp5: _otp5,
                              otp6: _otp6,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                registerWorkerProvider.resendButtonEnabled
                                ? TextButton(
                                  onPressed: () {
                                    resendWorkerOtp();
                                  },
                                  child: Text('Send New Code'),
                                )
                                : TextButton(
                                  onPressed: () {
                                  },
                                  child: Text('Send New Code',style: TextStyle(color: Colors.grey),),
                                ),
                                
                                Text(registerWorkerProvider.timerSeconds.toString(),style: TextStyle(color: Colors.white),),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 21,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: registerWorkerProvider.isVerifyLoading2
                                  ? Center(
                                      child: CircularProgressIndicator(
                                        color: ColorResources.GLOSSY_FLOSSY_YELLOW,
                                      ),
                                    )
                                  : ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  ColorResources
                                                      .GLOSSY_FLOSSY_YELLOW)),
                                      onPressed: () {
                                        verifyWorkerOtp();
                                      },
                                      child: Text(
                                        'Verify',
                                        style: poppinsRegular.copyWith(
                                            color:
                                                ColorResources.GLOSSY_FLOSSY_BLACK,
                                            fontSize: 16),
                                      ),
                                    ),
                            ),
                          ],
                        ),
                  );
                },
                 
              ),
            ),
          ],
        ),
      ),
    );
  }

  void verifyWorkerOtp() async {
    print('*/*/*/*/*/**/*/*');
    print(
        '${_otp1.text.trim()}${_otp2.text.trim()}${_otp3.text.trim()}${_otp4.text.trim()}${_otp5.text.trim()}${_otp6.text.trim()}');
    print('+91${widget.number}');
    print('*/*/*/*/*/**/*/*');
    String otp =
        '${_otp1.text.trim()}${_otp2.text.trim()}${_otp3.text.trim()}${_otp4.text.trim()}${_otp5.text.trim()}${_otp6.text.trim()}';
    String phoneNum = widget.number;
    OtpVerify otpVerify = OtpVerify(
      phoneNumber: phoneNum,
      otp: otp,
    );

    if (otp.length == 6) {
      Provider.of<RegisterWorkerProvider>(context, listen: false)
          .verifyPhoneNumber(otpVerify, route);
    } else {
      print('inside else verify');
    }
  }

  route(bool isRoute, String message) {
    if (isRoute) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        backgroundColor: ColorResources.SNACKBAR_green,
      ));
      Provider.of<RegisterWorkerProvider>(context, listen: false).updateOtpValue(true);
      Navigator.of(context).pop();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        backgroundColor: ColorResources.SNACKBAR_RED,
      ));
    }
  }

  void resendWorkerOtp() async {
    OtpPhoneNum otpPhoneNum = OtpPhoneNum(phoneNumber: widget.number);
    Provider.of<RegisterWorkerProvider>(context, listen: false).resendOtp(otpPhoneNum, resentRoute);
  }

   resentRoute(bool isRoute, String message) {
    if (isRoute) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        backgroundColor: ColorResources.SNACKBAR_green,
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        backgroundColor: ColorResources.SNACKBAR_RED,
      ));
    }
  }
}