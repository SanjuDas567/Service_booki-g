import 'package:flutter/material.dart';
import 'package:glossy_flossy/models/user/form_data/user_data.dart';
import 'package:glossy_flossy/provider/user/register_provider_user.dart';
import 'package:glossy_flossy/screen/user/login_page/login_page.dart';
import 'package:glossy_flossy/utils/color_resources.dart';
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
  final _confirmPasswordController = TextEditingController();
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
                      GestureDetector(
                        onTap: () => userProvider.pickImage(),
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
                      AppTextFormField(
                        hintText: 'Phone Number',
                        controller: _phoneNumberController,
                        isPhoneNumber: true,
                        regExp: r'[0-9]',
                        // focusNode: ,
                        textInputType: TextInputType.number,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      AppTextFormField(
                        hintText: 'Address',
                        controller: _addressController,
                        regExp: r'^[0-9a-zA-Z\s\.,\-]+$',
                        // focusNode: ,
                        textInputType: TextInputType.streetAddress,
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
                        readOnly: false,
                        hintText: 'Password',
                        controller: _passwordController,
                        allowSpecialCharactersAndNumbers: false,
                        regExp: r'',
                        // focusNode: ,
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
                        // focusNode: ,
                        textInputType: TextInputType.visiblePassword,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      userProvider.isLoading
                          ? const CircularProgressIndicator(
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
      } else if (userLname.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('last name must be required'),
          backgroundColor: Colors.red,
        ));
      } else if (email.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Email must be required'),
          backgroundColor: Colors.red,
        ));
      } else if (!isEmailValid(email)) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Invalid email format'),
          backgroundColor: Colors.red,
        ));
      } else if (phone.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Phone number must be required'),
          backgroundColor: Colors.red,
        ));
      } else if (address.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Address must be required'),
          backgroundColor: Colors.red,
        ));
      } else if (userPassword.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Password must be required'),
          backgroundColor: Colors.red,
        ));
      } else if (userPassword.length < 8) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Password must be at least 8 characters long'),
          backgroundColor: Colors.red,
        ));
      } else if (!userPassword.contains(RegExp(r'[A-Z]'))) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Password must contain at least one uppercase letter'),
          backgroundColor: Colors.red,
        ));
      } else if (!userPassword.contains(RegExp(r'[a-z]'))) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Password must contain at least one lowercase letter'),
          backgroundColor: Colors.red,
        ));
      } else if (!threeNumbersRegExp.hasMatch(userPassword)) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Password must contain exactly 3 numbers'),
          backgroundColor: Colors.red,
        ));
      } else if (!userPassword.contains(RegExp(r'[!@#\$%^&*(),.?":{}|<>]'))) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Password must contain at least one special character'),
          backgroundColor: Colors.red,
        ));
      } else if (_confirmPasswordController.text != _passwordController.text) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Confirm Password is not same'),
          backgroundColor: Colors.red,
        ));
      } else {
        // UserRegistrationModel userRegistrationModel = UserRegistrationModel();
        // userRegistrationModel.userFname = userFname;
        // userRegistrationModel.userLname = userLname;
        // userRegistrationModel.email = email;
        // userRegistrationModel.phone = phone;
        // userRegistrationModel.address = address;
        // userRegistrationModel.userPasword = userPassword;
        // userRegistrationModel.userProfilePic = null;
        // userRegistrationModel.appUser = 1;
        UserRegistration userRegistration = UserRegistration();
        userRegistration.userFname = userFname;
        userRegistration.userLname = userLname;
        userRegistration.email = email;
        userRegistration.phone = phone;
        userRegistration.address = address;
        userRegistration.userPasword = userPassword;
        userRegistration.appUser = 1;

        print(userRegistration.address);
        Provider.of<UserProvider>(context, listen: false)
            .userRegistration(userRegistration, route);
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

      await Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(errorMessage),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.red,
      ));
    }
  }
}
