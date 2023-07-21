import 'package:flutter/material.dart';
import 'package:glossy_flossy/models/user/login_model.dart';
import 'package:glossy_flossy/provider/user/login_provider_user.dart';
import 'package:glossy_flossy/screen/user/main_screen.dart/main_screen.dart';
import 'package:glossy_flossy/screen/user/register_page/register_page.dart';
import 'package:glossy_flossy/utils/images.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _passwordController = TextEditingController();

  final _emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final emailRegex = RegExp(
    r'^[a-zA-Z0-9.!#$%&*+-/=?^_`{|}~]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );
  @override
  void dispose() {
    print('inside dispose');
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final authProvider = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Form(
          autovalidateMode: AutovalidateMode.always,
          key: _formKey,
          child: SingleChildScrollView(
            child: Consumer<AuthProvider>(
              builder: (context, authProvider, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                  // validator: (value) {
                                  //   if (value == null ||
                                  //       value.isEmpty ||
                                  //       !value.contains('@') ||
                                  //       !value.contains('.')) {
                                  //     return 'Invalid Email';
                                  //   }
                                  //   return null;
                                  // },
                                  //email regexp in flutter?
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
                                      obscureText: authProvider.obscureValue,
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

                                        if (authProvider.obscureValue == true) {
                                          authProvider
                                              .changeValueOfObscureText(false);
                                        } else {
                                          authProvider
                                              .changeValueOfObscureText(true);
                                        }

                                        print(_emailController.text.trim());
                                        print(_passwordController.text.trim());
                                      },
                                      child: authProvider.obscureValue == true
                                          ? const Icon(
                                              Icons.visibility,
                                              color: Colors.black54,
                                            )
                                          : const Icon(
                                              Icons.visibility_off,
                                              color: Colors.black54,
                                            )),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          authProvider.isLoading
                              ? Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.yellow,
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: InkWell(
                                    onTap: () {
                                      print('sign up button pressed');
                                      loginUser(context);
                                    },
                                    child: Container(
                                      height: 40,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.yellow),
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          'Sign In',
                                          style:
                                              TextStyle(color: Colors.yellow),
                                        ),
                                      ),
                                    ),
                                  ),
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
                    Center(
                      child: InkWell(
                        onTap: () {
                          print('google icon pressed');
                        },
                        child: Image.asset(
                          Images.GOOGLE_IMAGE_LOGIN,
                          height: 40,
                        ),
                      ),
                    ),
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
                                builder: (context) => RegisterPage(),
                              ),
                            );
                            print(
                              'create new account button presed',
                            );
                          },
                          child: const Text(
                            ' create a new account',
                            style: TextStyle(color: Colors.yellow),
                          ),
                        )
                      ],
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  // login function
  void loginUser(BuildContext context) async {
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
      } else if (password.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Password must be required'),
          backgroundColor: Colors.red,
        ));
      } else {
        // if (Provider.of<AuthProviderBuyer>(context, listen: false).isRemember) {
        //   Provider.of<AuthProviderBuyer>(context, listen: false)
        //       .saveUserEmail(_email, _password);
        // } else {
        //   Provider.of<AuthProviderBuyer>(context, listen: false)
        //       .clearUserEmailAndPassword();
        // }
        LoginModel loginData = LoginModel();
        loginData.email = email;
        loginData.password = password;
         await Provider.of<AuthProvider>(context, listen: false)
            .login(loginData, route);
      }
    }
  }
// page route 
  route(bool isRoute, String errorMessage) async {
    print('inside route');
    print(errorMessage);

    if (isRoute) {
      // await Provider.of<ProfileProviderBuyer>(context, listen: false)
      //     .getBuyerInfo(context);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MainScreen(),
        ),
      );
      final token =
          Provider.of<AuthProvider>(context, listen: false).getUserToken();
      print("token inside route : $token");
      final name =
          Provider.of<AuthProvider>(context, listen: false).getUserName();
      print("name inside route : $name");

       final Id =
          Provider.of<AuthProvider>(context, listen: false).getUserId();
      print("name inside route : $Id");
    }
  }
}
