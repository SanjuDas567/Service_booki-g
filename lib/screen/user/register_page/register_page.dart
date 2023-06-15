import 'package:flutter/material.dart';
import 'package:glossy_flossy/screen/user/register_page/widgets/date_picker.dart';
// import 'package:glossy_flossy/widgets/custom_password_field.dart';
import 'package:glossy_flossy/widgets/custom_text_form_field.dart';
import 'package:intl/intl.dart';

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
  final _dateController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _addressController = TextEditingController();

  final _firstNameFocus = FocusNode();
  final _lastNameFocus = FocusNode();
  final _emailFocus = FocusNode();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1970),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        // selectedDate = picked;
        _dateController.text = DateFormat('dd-MM-yyyy').format(picked);
        ;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
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
                      Text(
                        'Create A New Account',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  AppTextFormField(
                    hintText: 'First Name',
                    ctrl: _firstNameController,
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
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  DatePickerDemo(
                    controller: _dateController,
                    hintText: 'Select Date Of Birth',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AppTextFormField(
                    hintText: 'Password',
                    ctrl: _passwordController,
                    // focusNode: ,
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AppTextFormField(
                    hintText: 'Confirm Password',
                    ctrl: _confirmPasswordController,
                    // focusNode: ,
                    keyboardType: TextInputType.number,
                  ),
                  // CustomTextField(
                  //   hintText: 'Confirm Password',
                  // ),
                  const SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () async {
                      print("first name : ${_firstNameController.text.trim()}");
                      print("last name : ${_lastNameController.text.trim()}");
                      print("email : ${_emailController.text.trim()}");
                      print(
                          "phone number : ${_phoneNumberController.text.trim()}");
                      print("address : ${_addressController.text.trim()}");
                      print("DOB : ${_dateController.text.trim()}");
                      print("password : ${_passwordController.text.trim()}");
                      print(
                          "confirm password : ${_confirmPasswordController.text.trim()}");
                    },
                    child: Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: const Text('Sign Up'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }

  void _controllerValidator() async {
    if (_formKey.currentState!.validate()) {}
  }
}
