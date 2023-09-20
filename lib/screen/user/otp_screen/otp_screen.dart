import 'package:flutter/material.dart';
import 'package:glossy_flossy/models/user/form_data/otp_mobile_form_data.dart';
import 'package:glossy_flossy/provider/user/register_provider_user.dart';
import 'package:glossy_flossy/screen/user/otp_screen/widgets/otp_text_field.dart';
import 'package:glossy_flossy/utils/color_resources.dart';
import 'package:glossy_flossy/utils/custom_fonts.dart';
import 'package:glossy_flossy/utils/images.dart';
import 'package:glossy_flossy/widgets/show_custom_modal_dialog.dart';
import 'package:provider/provider.dart';

class OtpScreen extends StatefulWidget {
  final String number;
  OtpScreen({super.key, required this.number});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {

  // late UserProvider userProvider;

  TextEditingController otp1 = TextEditingController();
  TextEditingController otp2 = TextEditingController();
  TextEditingController otp3 = TextEditingController();
  TextEditingController otp4 = TextEditingController();
  TextEditingController otp5 = TextEditingController();
  TextEditingController otp6 = TextEditingController();

  // @override
  // void initState() {
  //   userProvider = Provider.of<UserProvider>(context, listen: false);
  //   userProvider.startTimer();
  //   // TODO: implement initState
  //   super.initState();
  // }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: ColorResources.GLOSSY_FLOSSY_BLACK,
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              // CustomAppBar(isBackButton: 1, isNotification: 1),
              SliverToBoxAdapter(
                child: Consumer<UserProvider>(
                  builder: (context, userProvider, child) {
                    //  userProvider.startTimer();
                    return Column(
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
                          otp1: otp1,
                          otp2: otp2,
                          otp3: otp3,
                          otp4: otp4,
                          otp5: otp5,
                          otp6: otp6,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            userProvider.resendButtonEnabled
                            ? TextButton(
                              onPressed: () {
                                resendOtp();
                              },
                              child: Text('Send New Code'),
                            )
                            : TextButton(
                              onPressed: () {
                              },
                              child: Text('Send New Code',style: TextStyle(color: Colors.grey),),
                            ),
                            
                            Text(userProvider.timerSeconds.toString(),style: TextStyle(color: Colors.white),),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 21,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: userProvider.isVerifyLoading2
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
                                    verifyOtp();
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
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void verifyOtp() async {
    print('*/*/*/*/*/**/*/*');
    print(
        '${otp1.text.trim()}${otp2.text.trim()}${otp3.text.trim()}${otp4.text.trim()}${otp5.text.trim()}${otp6.text.trim()}');
    print('+91${widget.number}');
    print('*/*/*/*/*/**/*/*');
    String otp =
        '${otp1.text.trim()}${otp2.text.trim()}${otp3.text.trim()}${otp4.text.trim()}${otp5.text.trim()}${otp6.text.trim()}';
    String phoneNum = widget.number;
    OtpVerify otpVerify = OtpVerify(
      phoneNumber: phoneNum,
      otp: otp,
    );

    if (otp.length == 6) {
      Provider.of<UserProvider>(context, listen: false)
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
      Provider.of<UserProvider>(context, listen: false).updateOtpValue(true);
      Navigator.of(context).pop();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        backgroundColor: ColorResources.SNACKBAR_RED,
      ));
    }
  }

  void resendOtp() async {
    OtpPhoneNum otpPhoneNum = OtpPhoneNum(phoneNumber: widget.number);
    Provider.of<UserProvider>(context, listen: false).resendOtp(otpPhoneNum, resentRoute);
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
