import 'package:flutter/material.dart';
import 'package:glossy_flossy/models/user/user_profile_model.dart';
import 'package:glossy_flossy/provider/user/user_profile_provider.dart';
import 'package:glossy_flossy/screen/user/user_profile_edit_screen/widgets/email_textfield_profile_edit.dart';
import 'package:glossy_flossy/screen/user/user_profile_edit_screen/widgets/name_textfield_profile_edit.dart';
import 'package:glossy_flossy/screen/user/user_profile_edit_screen/widgets/phone_textfield_profile_edit.dart';
import 'package:glossy_flossy/utils/color_resources.dart';
import 'package:glossy_flossy/utils/images.dart';
import 'package:glossy_flossy/widgets/custom_app_bar.dart';
import 'package:provider/provider.dart';

class UserProfileEditScreen extends StatelessWidget {
  Message? message;
   UserProfileEditScreen({super.key, this.message});

  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

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
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Stack(clipBehavior: Clip.none, children: [
                        CircleAvatar(
                          radius: 77,
                          backgroundColor: ColorResources.GLOSSY_FLOSSY_YELLOW,
                          child: CircleAvatar(
                            radius: 75,
                            backgroundImage: userProfileProvider.profileImage != null
                                ? FileImage(userProfileProvider.profileImage!)
                            as ImageProvider<Object>?
                                : const AssetImage(Images.USER_BLACK_PROFILE_ICON),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: InkWell(
                            onTap: () {
                              userProfileProvider.pickImage();
                            },
                            child: Image.asset(
                              Images.CAMMERA_ICON,
                              height: 30,
                            ),
                          ),
                        ),
                      ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      UserNameField(
                        controller: _nameController,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      UserEmailField(
                        controller: _emailController,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      UserPhoneField(
                        controller: _phoneController,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      InkWell(
                        onTap: (){

                        },
                        child: Container(
                          height: 40,
                          width:
                          MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.yellow),
                            color: Colors.yellow,
                            borderRadius:
                            BorderRadius.circular(15),
                          ),
                          child: const Center(
                            child: Text(
                              'Sign In',
                              style: TextStyle(
                                  color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
