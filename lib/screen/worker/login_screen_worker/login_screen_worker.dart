import 'package:flutter/material.dart';
import 'package:glossy_flossy/provider/worker/login_provider_worker.dart';
import 'package:glossy_flossy/screen/worker/main_screen/main_screen_worker.dart';
import 'package:glossy_flossy/screen/worker/register_screen/register_screeen_worker.dart';
import 'package:glossy_flossy/utils/images.dart';
import 'package:provider/provider.dart';

class LoginPageWorker extends StatelessWidget {
  LoginPageWorker({super.key});

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
          child: Consumer<LoginProviderWorker>(
            builder: (context, loginProviderWorker, child) {
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
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: InkWell(
                              onTap: () {
                                print('sign up button pressed');
                                if (_emailController.text.trim() == 'worker' &&
                                    _passwordController.text.trim() ==
                                        'worker') {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MainScreenWorker(),
                                    ),
                                  );
                                } else {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          RegisterScreenWorker(),
                                    ),
                                  );
                                }
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
                                builder: (context) => RegisterScreenWorker(),
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