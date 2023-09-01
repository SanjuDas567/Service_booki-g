import 'package:flutter/material.dart';
import 'package:glossy_flossy/models/user/form_data/user_profile_update.dart';
import 'package:glossy_flossy/models/user/user_profile_model.dart';
import 'package:glossy_flossy/provider/user/user_profile_provider.dart';
import 'package:glossy_flossy/screen/user/user_profile_edit_screen/widgets/address_textfield_profile_edit%20copy.dart';
import 'package:glossy_flossy/screen/user/user_profile_edit_screen/widgets/email_textfield_profile_edit.dart';
import 'package:glossy_flossy/screen/user/user_profile_edit_screen/widgets/firstname_textfield_profile_edit.dart';
import 'package:glossy_flossy/screen/user/user_profile_edit_screen/widgets/lastname_textfield_profile_edit.dart';
import 'package:glossy_flossy/screen/user/user_profile_edit_screen/widgets/phone_textfield_profile_edit.dart';
import 'package:glossy_flossy/utils/app_constants.dart';
import 'package:glossy_flossy/utils/color_resources.dart';
import 'package:glossy_flossy/utils/images.dart';
import 'package:glossy_flossy/widgets/custom_app_bar.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class UserProfileEditScreen extends StatefulWidget {
  Message? message;
  UserProfileEditScreen({super.key, this.message});

  @override
  State<UserProfileEditScreen> createState() => _UserProfileEditScreenState();
}

class _UserProfileEditScreenState extends State<UserProfileEditScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _fnameController;
  late TextEditingController _lnameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late TextEditingController _addressController;

  @override
  void initState() {
    // TODO: implement initState
    _fnameController = TextEditingController(text: widget.message!.userFname);
    _lnameController = TextEditingController(text: widget.message!.userLname);
    _emailController = TextEditingController(text: widget.message!.email);
    _phoneController = TextEditingController(text: widget.message!.phone);
    _addressController = TextEditingController(text: widget.message!.address);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.GLOSSY_FLOSSY_BLACK,
      body: CustomScrollView(
        slivers: [
          CustomAppBar(isBackButton: 1, isNotification: 1),
          SliverToBoxAdapter(
            child: Consumer<UserProfileProvider>(
              builder: (context, userProfileProvider, child) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            CircleAvatar(
                              radius: 77,
                              backgroundColor:
                                  ColorResources.GLOSSY_FLOSSY_YELLOW,
                              child: CircleAvatar(
                                radius: 75,
                                backgroundImage:
                                    userProfileProvider.editProfileImage != null
                                        ? FileImage(userProfileProvider
                                                .editProfileImage!)
                                            as ImageProvider<Object>?
                                        : NetworkImage(AppConstants.BASE_URL +
                                            widget.message!.userProfilePic),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: InkWell(
                                onTap: () {
                                  userProfileProvider.pickEditImage();
                                },
                                child: Image.asset(
                                  Images.CAMMERA_ICON,
                                  height: 30,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        UserFirstNameField(
                          controller: _fnameController,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        UserLastNameField(
                          controller: _lnameController,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        UserEmailField(
                          controller: _emailController,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        UserPhoneField(
                          controller: _phoneController,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        AddressField(
                          controller: _addressController,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        userProfileProvider.isEditLoading
                            ? CircularProgressIndicator(
                                color: ColorResources.GLOSSY_FLOSSY_YELLOW,
                              )
                            : InkWell(
                                onTap: () {
                                  updateUserData();
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
                                      'Update Profile',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void updateUserData() {
    final userProfileProvider =
        Provider.of<UserProfileProvider>(context, listen: false);
    UserUpdateModel userUpdateModel = UserUpdateModel();
    userUpdateModel.userFname = _fnameController.text.trim();
    userUpdateModel.userLname = _lnameController.text.trim();
    userUpdateModel.email = _emailController.text.trim();
    userUpdateModel.phone = _phoneController.text.trim();
    userUpdateModel.address = _addressController.text.trim();
    userUpdateModel.appuser = 1;
    userUpdateModel.userPasword = widget.message!.userPasword;
    userUpdateModel.userProfilePic = widget.message!.userProfilePic;
    userUpdateModel.id = widget.message!.id;
    print('update user data');
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final isDataChanged =
          _fnameController.text != widget.message!.userFname ||
              _lnameController.text != widget.message!.userLname ||
              _emailController.text != widget.message!.email ||
              _phoneController.text != widget.message!.phone ||
              _addressController.text != widget.message!.address;
      final isImageChanged = userProfileProvider.editProfileImage != null;

      if (isDataChanged || isImageChanged) {
        print('inside data changes');
        FocusManager.instance.primaryFocus?.unfocus();
        Provider.of<UserProfileProvider>(context, listen: false)
            .updateUserData(userUpdateModel, route);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Data not changed'),
          backgroundColor: Colors.red,
        ));
        print('Data not changed');
      }
    }
  }

  route(bool isRoute, String errorMessage) async {
    print('inside route');
    print(errorMessage);

    if (isRoute) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(errorMessage),
        backgroundColor: Colors.green,
      ));
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(errorMessage),
        backgroundColor: Colors.red,
      ));
    }
  }
}
