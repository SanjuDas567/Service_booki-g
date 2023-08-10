import 'package:flutter/material.dart';
import 'package:glossy_flossy/models/worker/form_data/worker_login_model.dart';
import 'package:glossy_flossy/provider/worker/auth_provider_worker.dart';
import 'package:glossy_flossy/screen/worker/main_screen/main_screen_worker.dart';
import 'package:glossy_flossy/screen/worker/register_screen/register_screeen_worker.dart';
import 'package:glossy_flossy/utils/color_resources.dart';
import 'package:glossy_flossy/utils/images.dart';
import 'package:provider/provider.dart';

class LoginPageWorker extends StatefulWidget {
  LoginPageWorker({super.key});

  @override
  State<LoginPageWorker> createState() => _LoginPageWorkerState();
}

class _LoginPageWorkerState extends State<LoginPageWorker> {
  final _passwordController = TextEditingController();

  final _emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Consumer<AuthProviderWorker>(
            builder: (context, loginProviderWorker, child) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
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
                    const SizedBox(
                      height: 20,
                    ),
                    Center(child: Image.asset(Images.GLOSSY_FLOSSY_LOGO)),
                    const SizedBox(
                      height: 20,
                    ),
                    // user name
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.shade400,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 15,
                                  right: 15,
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
                            padding: const EdgeInsets.all(10),
                            child: Stack(
                              alignment: const Alignment(0, 0),
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade400,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 15,
                                      right: 15,
                                    ),
                                    child: TextFormField(
                                      controller: _passwordController,
                                      obscureText:
                                          loginProviderWorker.obscureValue,
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

                                      if (loginProviderWorker.obscureValue ==
                                          true) {
                                        loginProviderWorker
                                            .changeValueOfObscureText(false);
                                      } else {
                                        loginProviderWorker
                                            .changeValueOfObscureText(true);
                                      }

                                      print(_emailController.text.trim());
                                      print(_passwordController.text.trim());
                                    },
                                    child:
                                        loginProviderWorker.obscureValue == true
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
                          Consumer<AuthProviderWorker>(
                            builder: (context, authProviderWorker, child) {
                              return authProviderWorker.isWorkerLoginLoading
                                  ? Padding(
                                      padding: const EdgeInsets.all(12),
                                      child: CircularProgressIndicator(
                                        color: Colors.yellow,
                                      ),
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: InkWell(
                                        onTap: () {
                                          print('sign up button pressed');
                                          loginWorker(context);
                                        },
                                        child: Container(
                                          height: 40,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.yellow),
                                            color: Colors.black,
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: const Center(
                                            child: Text(
                                              'Sign In',
                                              style: TextStyle(
                                                  color: Colors.yellow),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                            },
                          )
                        ],
                      ),
                    ),
                    const Center(
                      child: Text(
                        'or',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // Center(
                    //   child: InkWell(
                    //     onTap: () {
                    //       print('google icon pressed');
                    //     },
                    //     child: Image.asset(
                    //       Images.GOOGLE_IMAGE_LOGIN,
                    //       height: 40,
                    //     ),
                    //   ),
                    // ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have account?",
                          style: TextStyle(color: Colors.white),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegisterScreenWorker(),
                              ),
                            );
                            print(
                              'create new account button presed',
                            );
                          },
                          child: const Text(
                            ' create a new account',
                            style: TextStyle(color: ColorResources.GLOSSY_FLOSSY_YELLOW),
                          ),
                        ),
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

  void loginWorker(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      FocusManager.instance.primaryFocus?.unfocus();
      _formKey.currentState!.save();

      String email = _emailController.text.trim();
      String password = _passwordController.text.trim();

      if (email.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Email must be required'),
          backgroundColor: Colors.red,
        ));
      } else if (!isEmailValid(email)) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Invalid email format'),
          backgroundColor: Colors.red,
        ));
      } else if (password.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Password must be required'),
          backgroundColor: Colors.red,
        ));
      }
      // else if (!isPasswordValid(password)) {
      //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //     content: Text('Invalid password format'),
      //     backgroundColor: Colors.red,
      //   ));
      // }
      else if (password.length < 8) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Password must be at least 8 characters long'),
          backgroundColor: Colors.red,
        ));
      } else if (!password.contains(RegExp(r'[A-Z]'))) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Password must contain at least one uppercase letter'),
          backgroundColor: Colors.red,
        ));
      } else if (!password.contains(RegExp(r'[a-z]'))) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Password must contain at least one lowercase letter'),
          backgroundColor: Colors.red,
        ));
      } else if (!threeNumbersRegExp.hasMatch(password)) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Password must contain exactly 3 numbers'),
          backgroundColor: Colors.red,
        ));
      } else if (!password.contains(RegExp(r'[!@#\$%^&*(),.?":{}|<>]'))) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Password must contain at least one special character'),
          backgroundColor: Colors.red,
        ));
      } else {
        LoginModelWorker loginModelWorker = LoginModelWorker();
        loginModelWorker.email = email;
        loginModelWorker.password = password;
        Provider.of<AuthProviderWorker>(context, listen: false)
            .workerLogin(loginModelWorker, route);
      }
    }
  }

  route(bool isRoute, String errorMessage) async {
    if (isRoute) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(errorMessage),
        backgroundColor: Colors.green,
      ));
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MainScreenWorker(),
        ),
      );
    } else if (isRoute == false) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(errorMessage),
        backgroundColor: Colors.red,
      ));
    }
  }
}
