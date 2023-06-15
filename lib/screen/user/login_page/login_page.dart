import 'package:flutter/material.dart';
import 'package:glossy_flossy/provider/login_provider.dart';
import 'package:glossy_flossy/screen/user/home_screen.dart/home_screen.dart';
import 'package:glossy_flossy/screen/user/main_screen.dart/main_screen.dart';
import 'package:glossy_flossy/screen/user/register_page/register_page.dart';
import 'package:glossy_flossy/utils/images.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

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
          child: Consumer<LoginProvider>(
            builder: (context, loginProvider, child) {
              return SingleChildScrollView(
                child: Column(
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
                                      obscureText: loginProvider.obscureValue,
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

                                        if (loginProvider.obscureValue ==
                                            true) {
                                          loginProvider
                                              .changeValueOfObscureText(false);
                                        } else {
                                          loginProvider
                                              .changeValueOfObscureText(true);
                                        }

                                        print(_emailController.text.trim());
                                        print(_passwordController.text.trim());
                                      },
                                      child: loginProvider.obscureValue == true
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
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: InkWell(
                              onTap: () {
                                print('sign up button pressed');
                                if (_emailController.text.trim() == 'sanju' &&
                                    _passwordController.text.trim() ==
                                        'sanju') {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MainScreen(),
                                    ),
                                  );
                                } else {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => RegisterPage(),
                                    ),
                                  );
                                }
                              },
                              child: Container(
                                height: 40,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Colors.yellow,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: const Center(
                                  child: Text('Sign In'),
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
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
