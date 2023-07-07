import 'package:flutter/material.dart';
import 'package:glossy_flossy/screen/worker/register_screen/widgets/email_field.dart';
import 'package:glossy_flossy/screen/worker/register_screen/widgets/validation_for_register.dart';
import 'package:glossy_flossy/screen/worker/register_screen/widgets/worker_first_name.dart';
import 'package:glossy_flossy/utils/color_resources.dart';

class RegisterScreenWorker extends StatelessWidget {
  RegisterScreenWorker({super.key});

  final _fnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  // late RegisterWorkerProvider _formProvider;

  @override
  Widget build(BuildContext context) {
    // Provider.of<RegisterWorkerProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: ColorResources.GLOSSY_FLOSSY_BLACK,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: ColorResources.GLOSSY_FLOSSY_BLACK,
            title: Text('Register'),
          ),
          SliverToBoxAdapter(
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.always,
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  WorkerFirstNameField(
                    controller: _fnameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      } else if (_fnameController.text.length < 8) {
                        return "too short";
                      } else if (_fnameController.text.contains("@")) {
                        return 'enter valid name';
                      }
                    },
                  ),
                  WorkerEmailField(
                    controller: _emailController,
                    validator: (value) {
                      if (value == null || _emailController.text.isEmpty) {
                        return 'Please Enter Email Address.';
                      } else if (RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value)) {
                        return 'Enter valid email';
                      }
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Validate returns true if the form is valid, or false otherwise.
                      if (_formKey.currentState!.validate()) {
                        // If the form is valid, display a snackbar. In the real world,
                        // you'd often call a server or save the information in a database.
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              backgroundColor: Colors.yellow,
                              content: Text('Processing Data')),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              backgroundColor: Colors.yellow,
                              content: Text('Enter required field data')),
                        );
                      }
                    },
                    child: const Text('Submit'),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
