import 'package:flutter/material.dart';
import 'package:glossy_flossy/models/user/form_data/otp_mobile_form_data.dart';
import 'package:glossy_flossy/models/user/form_data/user_data.dart';
import 'package:glossy_flossy/provider/user/register_provider_user.dart';
import 'package:glossy_flossy/screen/user/otp_screen/otp_screen.dart';
import 'package:glossy_flossy/screen/user/login_page/login_page.dart';
import 'package:glossy_flossy/utils/color_resources.dart';
import 'package:glossy_flossy/utils/images.dart';
import 'package:glossy_flossy/widgets/custom_page_route.dart';
import 'package:glossy_flossy/widgets/custom_text_form_field.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late UserProvider userProvider;
  DateTime selectedDate = DateTime.now();

  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  // final _dateController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _addressController = TextEditingController();
  final _firstNameFocus = FocusNode();
  final _lastNameFocus = FocusNode();
  final _emailFocus = FocusNode();
  final _phoneNumberFocus = FocusNode();
  final _addressFocus = FocusNode();
  final _passwordFocus = FocusNode();
  final _confirmPasswordFocus = FocusNode();
  @override
  void initState() {
    // TODO: implement initState
    userProvider = Provider.of<UserProvider>(context, listen: false);
    super.initState();
  }

  @override
  void dispose() {
    print('inside dispose');
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _addressController.dispose();
    userProvider.clearImageUser();
    userProvider.verifyOtp
    ? userProvider.disposeOtpValue(false)
    : null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, userProvider, child) {
        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Image.asset(
              Images.GLOSSY_FLOSSY_LOGO,
              height: 35,
            ),
            centerTitle: true,
          ),
          body: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Create A New Account',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () => userProvider.pickImage(imageSizeRoute),
                        child: CircleAvatar(
                          backgroundColor: Colors.yellow,
                          radius: 82,
                          child: CircleAvatar(
                            radius: 80,
                            backgroundColor: Colors.black,
                            backgroundImage: userProvider.profileImage != null
                                ? FileImage(userProvider.profileImage!)
                                    as ImageProvider<Object>?
                                : null,
                            child: userProvider.profileImage == null
                                ? const Icon(Icons.add_a_photo)
                                : null,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      AppTextFormField(
                        hintText: 'First Name',
                        controller: _firstNameController,
                        focusNode: _firstNameFocus,
                        nextNode: _lastNameFocus,
                        regExp: r'^[a-zA-Z ]+$',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      AppTextFormField(
                        hintText: 'Last Name',
                        controller: _lastNameController,
                        focusNode: _lastNameFocus,
                        regExp: r'^[a-zA-Z ]+$',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      AppTextFormField(
                        hintText: 'Email',
                        controller: _emailController,
                        focusNode: _emailFocus,
                        allowSpecialCharactersAndNumbers: false,
                        regExp: r'',
                      ),
                      const SizedBox(
                        height: 10,
                      ),

                      // const SizedBox(
                      //   height: 10,
                      // ),
                      AppTextFormField(
                        hintText: 'Address',
                        controller: _addressController,
                        regExp: r'^[0-9a-zA-Z\s\.,\-]+$',
                        focusNode: _addressFocus,
                        textInputType: TextInputType.streetAddress,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      AppTextFormField(
                        readOnly: false,
                        hintText: 'Password',
                        controller: _passwordController,
                        allowSpecialCharactersAndNumbers: false,
                        regExp: r'',
                        focusNode: _passwordFocus,
                        textInputType: TextInputType.visiblePassword,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      AppTextFormField(
                        readOnly: false,
                        hintText: 'Confirm Password',
                        controller: _confirmPasswordController,
                        allowSpecialCharactersAndNumbers: false,
                        regExp: r'',
                        focusNode: _confirmPasswordFocus,
                        textInputType: TextInputType.visiblePassword,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      AppTextFormField(
                        hintText: 'Phone Number',
                        controller: _phoneNumberController,
                        isPhoneNumber: true,
                        regExp: r'[0-9]',
                        focusNode: _phoneNumberFocus,
                        textInputType: TextInputType.number,
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: userProvider.isVerifyLoading
                            ? CircularProgressIndicator(
                                color: ColorResources.GLOSSY_FLOSSY_YELLOW,
                              )
                            : !userProvider.verifyOtp
                                ? TextButton(
                                    onPressed: () {
                                      phoneNumberSendig(
                                          _phoneNumberController.text.trim());
                                    },
                                    child: const Text(
                                      'verify',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: ColorResources.SNACKBAR_RED),
                                    ))
                                : TextButton(
                                    onPressed: () {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text('verified sussfully'),
                                        behavior: SnackBarBehavior.floating,
                                        backgroundColor:
                                            ColorResources.SNACKBAR_RED,
                                      ));
                                    },
                                    child: const Text(
                                      'verified',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: ColorResources.SNACKBAR_green),
                                    ),
                                  ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      userProvider.isLoading
                          ? const CircularProgressIndicator(
                              color: Colors.yellow,
                            )
                          :
                          // userProvider.verifyOtp
                          //     ?
                          InkWell(
                              onTap: () async {
                                _controllerValidator();
                              },
                              child: Container(
                                height: 40,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: ColorResources.GLOSSY_FLOSSY_YELLOW,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: const Center(
                                  child: Text(
                                    'Sign Up',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            )
                      // : InkWell(
                      //     onTap: () {
                      //       ScaffoldMessenger.of(context)
                      //           .showSnackBar(const SnackBar(
                      //         content: Text(
                      //             'Phone number verification pending'),
                      //         backgroundColor: Colors.red,
                      //       ));
                      //       FocusScope.of(context).requestFocus(_phoneNumberFocus);
                      //     },
                      //     child: Container(
                      //       height: 40,
                      //       width: MediaQuery.of(context).size.width,
                      //       decoration: BoxDecoration(
                      //         color: Colors.yellow.shade100,
                      //         borderRadius: BorderRadius.circular(15),
                      //       ),
                      //       child: const Center(
                      //         child: Text(
                      //           'Sign Up',
                      //           style: TextStyle(
                      //               fontWeight: FontWeight.bold),
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                    ],
                  ),
                ),
              )),
        );
      },
    );
  }

  void _controllerValidator() async {
    if (_formKey.currentState!.validate()) {
      FocusManager.instance.primaryFocus?.unfocus();
      _formKey.currentState!.save();

      String userFname = _firstNameController.text.trim();
      String userLname = _lastNameController.text.trim();
      String email = _emailController.text.trim().toLowerCase();
      String phone = _phoneNumberController.text.trim();
      String address = _addressController.text.trim();
      String userPassword = _passwordController.text.trim();

      RegExp threeNumbersRegExp = RegExp(r'^\D*\d{3}\D*$');
      bool isEmailValid(String email) {
        // Define the regular expression pattern for email validation
        RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
        return emailRegExp.hasMatch(email);
      }

      final userProvider = Provider.of<UserProvider>(context, listen: false);
      if (userProvider.profileImage == null) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Profile image must be required'),
          backgroundColor: Colors.red,
        ));
      } else if (userFname.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('First name must be required'),
          backgroundColor: Colors.red,
        ));
        FocusScope.of(context).requestFocus(_firstNameFocus);
      } else if (userLname.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('last name must be required'),
          backgroundColor: Colors.red,
        ));
        FocusScope.of(context).requestFocus(_lastNameFocus);
      } else if (email.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Email must be required'),
          backgroundColor: Colors.red,
        ));
        FocusScope.of(context).requestFocus(_emailFocus);
      } else if (!isEmailValid(email)) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Invalid email format'),
          backgroundColor: Colors.red,
        ));
        FocusScope.of(context).requestFocus(_emailFocus);
      } else if (address.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Address must be required'),
          backgroundColor: Colors.red,
        ));
        FocusScope.of(context).requestFocus(_addressFocus);
      } else if (userPassword.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Password must be required'),
          backgroundColor: Colors.red,
        ));
        FocusScope.of(context).requestFocus(_passwordFocus);
      } else if (userPassword.length < 8) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Password must be at least 8 characters long'),
          backgroundColor: Colors.red,
        ));
        FocusScope.of(context).requestFocus(_passwordFocus);
      } else if (!userPassword.contains(RegExp(r'[A-Z]'))) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Password must contain at least one uppercase letter'),
          backgroundColor: Colors.red,
        ));
        FocusScope.of(context).requestFocus(_passwordFocus);
      } else if (!userPassword.contains(RegExp(r'[a-z]'))) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Password must contain at least one lowercase letter'),
          backgroundColor: Colors.red,
        ));
        FocusScope.of(context).requestFocus(_passwordFocus);
      } else if (!threeNumbersRegExp.hasMatch(userPassword)) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Password must contain exactly 3 numbers'),
          backgroundColor: Colors.red,
        ));
        FocusScope.of(context).requestFocus(_passwordFocus);
      } else if (!userPassword.contains(RegExp(r'[!@#\$%^&*(),.?":{}|<>]'))) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Password must contain at least one special character'),
          backgroundColor: Colors.red,
        ));
        FocusScope.of(context).requestFocus(_passwordFocus);
      } else if (_confirmPasswordController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Confirm Password field must be required'),
          backgroundColor: Colors.red,
        ));
        FocusScope.of(context).requestFocus(_confirmPasswordFocus);
      } else if (_confirmPasswordController.text != _passwordController.text) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Confirm Password is not same'),
          backgroundColor: Colors.red,
        ));
        FocusScope.of(context).requestFocus(_confirmPasswordFocus);
      } else if (phone.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Phone number must be required'),
          backgroundColor: Colors.red,
        ));
        FocusScope.of(context).requestFocus(_phoneNumberFocus);
      } else {
        UserRegistration userRegistration = UserRegistration();
        userRegistration.userFname = userFname;
        userRegistration.userLname = userLname;
        userRegistration.email = email;
        userRegistration.phone = phone;
        userRegistration.address = address;
        userRegistration.userPasword = userPassword;
        userRegistration.appUser = 1;

        print(userRegistration.address);
        if (userProvider.verifyOtp) {
          Provider.of<UserProvider>(context, listen: false)
              .userRegistration(userRegistration, route);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Phone number verification need to complete'),
            backgroundColor: Colors.red,
          ));
          FocusScope.of(context).requestFocus(_phoneNumberFocus);
        }
      }
    }
  }

  route(bool isRoute, String errorMessage) async {
    print('inside route');
    print(errorMessage);

    if (isRoute) {
      // await Provider.of<ProfileProviderBuyer>(context, listen: false)
      //     .getBuyerInfo(context);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(errorMessage),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.green,
      ));
      Provider.of<UserProvider>(context, listen: false).updateOtpValue(false);
      await Navigator.pushReplacement(
        context,
        CustomDownPageRoute(child: LoginPage(), direction: AxisDirection.up),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(errorMessage),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.red,
      ));
    }
  }

// Otp api calling and routing :--------------------------------------------------------------------------------
  void phoneNumberSendig(String pNumber) {
    OtpPhoneNum otpPhoneNum = OtpPhoneNum(phoneNumber: '+91$pNumber');
    if (_phoneNumberController.text.isNotEmpty) {
      Provider.of<UserProvider>(context, listen: false)
          .sendPhoneNumberOtp(otpPhoneNum, otpRoute);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Phone number required for verification'),
        backgroundColor: Colors.red,
      ));
    }
  }

  otpRoute(bool isRoute, String otpMessage) async {
    if (isRoute) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(otpMessage),
        behavior: SnackBarBehavior.floating,
        backgroundColor: ColorResources.SNACKBAR_green,
      ));
      Navigator.push(
        context,
        CustomDownPageRoute(
          child: OtpScreen(
            number: "+91${_phoneNumberController.text.trim()}",
          ),
          direction: AxisDirection.up,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(otpMessage),
        behavior: SnackBarBehavior.floating,
        backgroundColor: ColorResources.SNACKBAR_RED,
      ));
    }
  }
  // Otp api calling and routing :--------------------------------------------------------------------------------

  imageSizeRoute(bool isRoute, String message) {
    if (isRoute) {
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        backgroundColor: ColorResources.SNACKBAR_RED,
      ));
    }
  }
}
