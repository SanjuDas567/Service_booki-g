import 'package:flutter/material.dart';
import 'package:glossy_flossy/models/admin/login_model_admin.dart';
import 'package:glossy_flossy/provider/admin/login_provider_admin.dart';
import 'package:glossy_flossy/screen/admin/main_screen/admin_main_screen.dart';
import 'package:glossy_flossy/screen/user/main_screen.dart/main_screen.dart';
import 'package:glossy_flossy/utils/dimentions.dart';
import 'package:glossy_flossy/utils/images.dart';
import 'package:glossy_flossy/widgets/custom_page_route.dart';
import 'package:provider/provider.dart';

class LoginPageAdmin extends StatefulWidget {
  LoginPageAdmin({super.key});

  @override
  State<LoginPageAdmin> createState() => _LoginPageAdminState();
}

class _LoginPageAdminState extends State<LoginPageAdmin> {
  final _passwordController = TextEditingController();

  final _emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Consumer<LoginProviderAdmin>(
            builder: (context, loginProviderAdmin, child) {
              return SingleChildScrollView(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(Dimensions.MARGIN_SIZE_SMALL),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Welcome',
                                style: TextStyle(
                                    color: Colors.yellow,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Login to continue',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 6.5,
                    ),
                    Center(child: Image.asset(Images.GLOSSY_FLOSSY_LOGO)),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 20.5,
                    ),
                    // user name
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(Dimensions.MARGIN_SIZE_SMALL),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.shade400,
                              borderRadius: BorderRadius.circular(Dimensions.MARGIN_SIZE_SMALL),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: Dimensions.PADDING_SIZE_DEFAULT,
                                right: Dimensions.PADDING_SIZE_DEFAULT,
                              ),
                              child: TextFormField(
                                controller: _emailController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: 'Email',
                                  labelStyle: TextStyle(
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        // password
                        Padding(
                          padding: const EdgeInsets.all(Dimensions.MARGIN_SIZE_SMALL),
                          child: Stack(
                            alignment: const Alignment(0, 0),
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade400,
                                  borderRadius: BorderRadius.circular(Dimensions.MARGIN_SIZE_SMALL),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 15,
                                    right: 15,
                                  ),
                                  child: TextFormField(
                                    controller: _passwordController,
                                    obscureText:
                                        loginProviderAdmin.obscureValue,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      labelText: 'Your password',
                                      labelStyle: TextStyle(
                                        color: Colors.grey.shade600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 15,
                                child: InkWell(
                                  onTap: () {
                                    // _controller.clear();

                                    if (loginProviderAdmin.obscureValue ==
                                        true) {
                                      loginProviderAdmin
                                          .changeValueOfObscureText(false);
                                    } else {
                                      loginProviderAdmin
                                          .changeValueOfObscureText(true);
                                    }

                                    print(_emailController.text.trim());
                                    print(_passwordController.text.trim());
                                  },
                                  child:
                                      loginProviderAdmin.obscureValue == true
                                          ? const Icon(
                                              Icons.visibility,
                                              color: Colors.black54,
                                            )
                                          : const Icon(
                                              Icons.visibility_off,
                                              color: Colors.black54,
                                            ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(Dimensions.MARGIN_SIZE_SMALL),
                          child: InkWell(
                            onTap: () {
                              loginAdmin();
                            },
                            child: Container(
                              height: 40,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.yellow),
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: const Center(
                                child: Text(
                                  'Sign In',
                                  style: TextStyle(color: Colors.yellow),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  bool isEmailValid(String email) {
    // Define the regular expression pattern for email validation
    RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegExp.hasMatch(email);
  }

  // bool isPasswordValid(String password) {
  RegExp threeNumbersRegExp = RegExp(r'^\D*\d{3}\D*$');

  void loginAdmin() async {
    if(_formKey.currentState!.validate()) {
      FocusManager.instance.primaryFocus?.unfocus();
      _formKey.currentState!.save();

      String email = _emailController.text.trim();
      String password = _passwordController.text.trim();

      if(email.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Email must be required'),
          backgroundColor: Colors.red,),);
      } else if (!isEmailValid(email)) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Invalid email format'),
          backgroundColor: Colors.red,
        ));
      } else if (password.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Password must be required'),
          backgroundColor: Colors.red,
        ));
      }
      else if (password.length < 8) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Password must be at least 8 characters long'),
          backgroundColor: Colors.red,
        ));
      } else if (!password.contains(RegExp(r'[A-Z]'))) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Password must contain at least one uppercase letter'),
          backgroundColor: Colors.red,
        ));
      } else if (!password.contains(RegExp(r'[a-z]'))) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Password must contain at least one lowercase letter'),
          backgroundColor: Colors.red,
        ));
      } else if (!threeNumbersRegExp.hasMatch(password)) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Password must contain exactly 3 numbers'),
          backgroundColor: Colors.red,
        ));
      } else if (!password.contains(RegExp(r'[!@#\$%^&*(),.?":{}|<>]'))) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Password must contain at least one special character'),
          backgroundColor: Colors.red,
        ));
      } else {
        LoginModelAdmin loginData = LoginModelAdmin();
        loginData.email = email;
        loginData.password = password;
        await Provider.of<LoginProviderAdmin>(context, listen: false)
            .adminLogin(loginData, route);
      }
    }
  }
  // page route :---------------------------------------------------------------
  route(bool isRoute, String errorMessage) async {

    if (isRoute) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text(errorMessage),
        backgroundColor: Colors.green,
      ));

      Navigator.pushReplacement(
        context,
        CustomDownPageRoute(
            child: AdminMainScreen(),
            direction: AxisDirection.up
        ),
      );
    } else if (isRoute == false) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text(errorMessage),
        backgroundColor: Colors.red,
      ));
    }
  }
}
