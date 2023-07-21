import 'package:flutter/material.dart';
import 'package:glossy_flossy/models/user/user_registration_model.dart';
import 'package:glossy_flossy/provider/user/register_provider_user.dart';
import 'package:glossy_flossy/screen/user/login_page/login_page.dart';
// import 'package:glossy_flossy/screen/user/register_page/widgets/date_picker.dart';
import 'package:glossy_flossy/utils/images.dart';
// import 'package:glossy_flossy/widgets/custom_password_field.dart';
import 'package:glossy_flossy/widgets/custom_text_form_field.dart';
import 'package:provider/provider.dart';
// import 'package:intl/intl.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  DateTime selectedDate = DateTime.now();

  final _formKey = GlobalKey<FormState>();

  final _firstNameController = TextEditingController();

  final _lastNameController = TextEditingController();

  final _emailController = TextEditingController();

  final _phoneNumberController = TextEditingController();

  // final _dateController = TextEditingController();
  final _passwordController = TextEditingController();

  // final _confirmPasswordController = TextEditingController();
  final _addressController = TextEditingController();

  final _firstNameFocus = FocusNode();

  final _lastNameFocus = FocusNode();

  final _emailFocus = FocusNode();

  // final _phoneNumberFocus = FocusNode();

  @override
  void dispose() {
    print('inside dispose');
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _passwordController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              child: Consumer<UserProvider>(
                builder: (context, userProvider, child) {
                  return Column(
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
                      AppTextFormField(
                        hintText: 'First Name',
                        ctrl: _firstNameController,
                        focusNode: _firstNameFocus,
                        validator: (input) {
                          // if (_firstNameController.text == '' ||
                          //     RegExp(r'^[a-z A-Z]+$').hasMatch(input)) {
                          //   return "Please enter your first name";
                          // } else if (_firstNameController.text
                          //     .contains(RegExp(r'^[a-z A-Z]+$'))) {
                          //   return null;
                          // } else {
                          //   return null;
                          // }
                        },
                        onFieldSubmitted: () {
                          FocusScope.of(context).requestFocus(_lastNameFocus);
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      AppTextFormField(
                        hintText: 'Last Name',
                        ctrl: _lastNameController,
                        focusNode: _lastNameFocus,
                        onFieldSubmitted: () {
                          FocusScope.of(context).requestFocus(_emailFocus);
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      AppTextFormField(
                        hintText: 'Email',
                        ctrl: _emailController,
                        focusNode: _emailFocus,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      AppTextFormField(
                        hintText: 'Phone Number',
                        ctrl: _phoneNumberController,
                        // focusNode: ,
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      AppTextFormField(
                        hintText: 'Address',
                        ctrl: _addressController,
                        // focusNode: ,
                        keyboardType: TextInputType.streetAddress,
                      ),
                      // const SizedBox(
                      //   height: 10,
                      // ),
                      // DatePickerDemo(
                      //   controller: _dateController,
                      //   hintText: 'Select Date Of Birth',
                      // ),
                      const SizedBox(
                        height: 10,
                      ),
                      AppTextFormField(
                        hintText: 'Password',
                        ctrl: _passwordController,
                        // focusNode: ,
                        keyboardType: TextInputType.visiblePassword,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // AppTextFormField(
                      //   hintText: 'Confirm Password',
                      //   ctrl: _confirmPasswordController,
                      //   // focusNode: ,
                      //   keyboardType: TextInputType.number,
                      // ),
                      // CustomTextField(
                      //   hintText: 'Confirm Password',
                      // ),
                      const SizedBox(
                        height: 30,
                      ),
                      userProvider.isLoading
                          ? CircularProgressIndicator(
                              color: Colors.yellow,
                            )
                          : InkWell(
                              onTap: () async {
                                _controllerValidator();
                              },
                              child: Container(
                                height: 40,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.yellow,
                                  ),
                                  color: Colors.yellow,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Center(
                                  child: const Text(
                                    'Sign Up',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                    ],
                  );
                },
              ),
            ),
          )),
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

      if (userFname.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('First name must be required'),
          backgroundColor: Colors.red,
        ));
      } else if (userLname.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('last name must be required'),
          backgroundColor: Colors.red,
        ));
      } else if (email.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Email must be required'),
          backgroundColor: Colors.red,
        ));
      } else if (phone.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Phone number must be required'),
          backgroundColor: Colors.red,
        ));
      } else if (address.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Address must be required'),
          backgroundColor: Colors.red,
        ));
      } else if (userPassword.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Password must be required'),
          backgroundColor: Colors.red,
        ));
      } else {
        UserRegistrationModel userRegistrationModel = UserRegistrationModel(
          userFname: userFname,
          userLname: userLname,
          email: email,
          phone: phone,
          address: address,
          userPassword: userPassword,
        );

        print(userRegistrationModel.address);
        Provider.of<UserProvider>(context, listen: false)
            .userRegistration(userRegistrationModel, route);
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
        backgroundColor: Colors.green,
      ));

      await Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ),
      );
    }
  }
}
