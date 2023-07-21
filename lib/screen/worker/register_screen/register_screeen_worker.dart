import 'package:flutter/material.dart';
import 'package:glossy_flossy/models/admin/form_data/worker_register_model.dart';
import 'package:glossy_flossy/provider/worker/register_screen_provider_worker.dart';
import 'package:glossy_flossy/screen/worker/login_screen_worker/login_screen_worker.dart';
import 'package:glossy_flossy/screen/worker/register_screen/widgets/email_field.dart';
import 'package:glossy_flossy/screen/worker/register_screen/widgets/worker_first_name.dart';
import 'package:glossy_flossy/utils/color_resources.dart';
import 'package:glossy_flossy/utils/images.dart';
import 'package:glossy_flossy/widgets/custom_text_form_field.dart';
import 'package:provider/provider.dart';

class RegisterScreenWorker extends StatefulWidget {
  RegisterScreenWorker({super.key});

  @override
  State<RegisterScreenWorker> createState() => _RegisterScreenWorkerState();
}

class _RegisterScreenWorkerState extends State<RegisterScreenWorker> {
  final _fnameController = TextEditingController();

  final _lNameController = TextEditingController();

  final _phoneController = TextEditingController();

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  final _addressController = TextEditingController();

  final _locationController = TextEditingController();

  final _workExperienceController = TextEditingController();

  final _insuranceIdController = TextEditingController();

  final _traingCourceController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Provider.of<RegisterWorkerProvider>(context, listen: false);
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
                  Stack(clipBehavior: Clip.none, children: [
                    CircleAvatar(
                      radius: 75,
                      backgroundColor: ColorResources.GLOSSY_FLOSSY_YELLOW,
                      child: CircleAvatar(
                        radius: 75,
                        backgroundImage:
                            AssetImage(Images.USER_iCON_USER_SELECTION),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: InkWell(
                        onTap: () {},
                        child: Image.asset(
                          Images.CAMMERA_ICON,
                          height: 30,
                        ),
                      ),
                    ),
                  ]),
                  SizedBox(
                    height: 30,
                  ),
                  WorkerFirstNameField(
                    controller: _fnameController,
                    validator: (value) {
                      // if (value == null || value.isEmpty) {
                      //   return 'Please enter some text';
                      // } else if (_fnameController.text.length < 8) {
                      //   return "too short";
                      // } else if (_fnameController.text.contains("@")) {
                      //   return 'enter valid name';
                      // }
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  AppTextFormField(
                    ctrl: _lNameController,
                    validator: () {},
                    hintText: 'Last Name',
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  WorkerEmailField(
                    controller: _emailController,
                    validator: (value) {
                      // if (value == null || _emailController.text.isEmpty) {
                      //   return 'Please Enter Email Address.';
                      // } else if (RegExp(
                      //         r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      //     .hasMatch(value)) {
                      //   return 'Enter valid email';
                      // }
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  AppTextFormField(
                    ctrl: _passwordController,
                    validator: () {},
                    hintText: 'Password',
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  AppTextFormField(
                    ctrl: _phoneController,
                    validator: () {},
                    hintText: 'Phone Number',
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  AppTextFormField(
                    ctrl: _addressController,
                    validator: () {},
                    hintText: 'Address',
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  AppTextFormField(
                    ctrl: _locationController,
                    validator: () {},
                    hintText: 'Location',
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  AppTextFormField(
                    ctrl: _workExperienceController,
                    validator: () {},
                    hintText: 'Work experience',
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Consumer<RegisterWorkerProvider>(
                    builder: (context, timeInputProvider, _) {
                      return TextField(
                        controller: timeInputProvider.avilTimeInputController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            // icon: Icon(
                            //   Icons.timer,
                            //   color: ColorResources.GLOSSY_FLOSSY_YELLOW,
                            // ),

                            labelText: "Working hours from",
                            hintStyle: TextStyle(color: Colors.yellow.shade300),
                            labelStyle:
                                const TextStyle(color: Colors.yellowAccent),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide:
                                  const BorderSide(color: Colors.yellow),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18),
                                borderSide:
                                    const BorderSide(color: Colors.yellow))),
                        readOnly: true,
                        onTap: () => timeInputProvider.selectTime(context),
                      );
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Consumer<RegisterWorkerProvider>(
                    builder: (context, timeInputProvider, _) {
                      return TextField(
                        controller: timeInputProvider.avilToTimeInputController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            // icon: Icon(
                            //   Icons.timer,
                            //   color: ColorResources.GLOSSY_FLOSSY_YELLOW,
                            // ),

                            labelText: "Working hours to",
                            hintStyle: TextStyle(color: Colors.yellow.shade300),
                            labelStyle:
                                const TextStyle(color: Colors.yellowAccent),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide:
                                  const BorderSide(color: Colors.yellow),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18),
                                borderSide:
                                    const BorderSide(color: Colors.yellow))),
                        readOnly: true,
                        onTap: () => timeInputProvider.selectToTime(context),
                      );
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  AppTextFormField(
                    ctrl: _insuranceIdController,
                    validator: () {},
                    hintText: 'Insurance id',
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  AppTextFormField(
                    ctrl: _traingCourceController,
                    validator: () {},
                    hintText: 'Training course',
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Consumer<RegisterWorkerProvider>(
                    builder: (context, registerWorkerProvider, child) {
                      return registerWorkerProvider.isRegistrationLoading
                          ? Center(
                              child: CircularProgressIndicator(
                                color: ColorResources.GLOSSY_FLOSSY_YELLOW,
                              ),
                            )
                          : InkWell(
                              onTap: () {
                                registerWorker(context);
                              },
                              child: Container(
                                height: 40,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.yellow),
                                  color: Colors.yellow,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: const Center(
                                  child: Text(
                                    'Sign In',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            );
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void registerWorker(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      FocusManager.instance.primaryFocus?.unfocus();
      _formKey.currentState!.save();
      print('inside worker call validate');
      final regWorkerProvider =
          Provider.of<RegisterWorkerProvider>(context, listen: false);

      String empFirstname = _fnameController.text.trim();
      String empLastname = _lNameController.text.trim();
      String empEmail = _emailController.text.trim();
      String empPassword = _passwordController.text.trim();
      String empPhone = _phoneController.text.trim();
      String empAddress = _addressController.text.trim();
      String empLocation = _locationController.text.trim();
      String experience = _workExperienceController.text.trim();
      String workAvlFrom =
          regWorkerProvider.avilTimeInputController.text.trim();
      String workAvlTo =
          regWorkerProvider.avilToTimeInputController.text.trim();
      String isuenceId = _insuranceIdController.text.trim();
      String triningCourse = _traingCourceController.text.trim();

      if (empFirstname.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('First name must be required'),
          backgroundColor: Colors.red,
        ));
      } else if (empLastname.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('last name must be required'),
          backgroundColor: Colors.red,
        ));
      } else if (empEmail.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Email must be required'),
          backgroundColor: Colors.red,
        ));
      } else if (empPassword.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Password must be required'),
          backgroundColor: Colors.red,
        ));
      } else if (empPhone.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Phone number must be required'),
          backgroundColor: Colors.red,
        ));
      } else if (empAddress.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Address must be required'),
          backgroundColor: Colors.red,
        ));
      } else if (empLocation.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Location must be required'),
          backgroundColor: Colors.red,
        ));
      } else if (experience.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Work Experiance must be required'),
          backgroundColor: Colors.red,
        ));
      } else if (workAvlFrom.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Working hrs from must be required'),
          backgroundColor: Colors.red,
        ));
      } else if (workAvlTo.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Working hrs to must be required'),
          backgroundColor: Colors.red,
        ));
      } else if (isuenceId.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('InsuranceID must be required'),
          backgroundColor: Colors.red,
        ));
      } else if (triningCourse.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Training course must be required'),
          backgroundColor: Colors.red,
        ));
      } else {
        print("inside else work reg");
        WorkerRegistrationModel workerRegistrationModel =
            WorkerRegistrationModel();

        workerRegistrationModel.empFirstname = empFirstname;
        workerRegistrationModel.empLastname = empLastname;
        workerRegistrationModel.empEmail = empEmail;
        workerRegistrationModel.empPassword = empPassword;
        workerRegistrationModel.empPhone = empPhone;
        workerRegistrationModel.empAddress = empAddress;
        workerRegistrationModel.empLocation = empLocation;
        workerRegistrationModel.experience = experience;
        workerRegistrationModel.workAvlFrom = workAvlFrom;
        workerRegistrationModel.workAvlTo = workAvlTo;
        workerRegistrationModel.isuenceId = isuenceId;
        workerRegistrationModel.triningCourse = triningCourse;
        workerRegistrationModel.empProfilePic = null;
        workerRegistrationModel.appUser = 2;

        Provider.of<RegisterWorkerProvider>(context, listen: false)
            .workerRegistration(workerRegistrationModel, route);
      }
    } else {}
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
          builder: (context) => LoginPageWorker(),
        ),
      );
    }
  }
}
