import 'package:flutter/material.dart';
import 'package:glossy_flossy/provider/user/login_provider_user.dart';
import 'package:glossy_flossy/provider/user/user_profile_provider.dart';
import 'package:glossy_flossy/screen/user/profile_screen/widgets/field_to_show_details.dart';
import 'package:glossy_flossy/screen/user/user_profile_edit_screen/user_profile_edit_screen.dart';
import 'package:glossy_flossy/utils/app_constants.dart';
import 'package:glossy_flossy/utils/color_resources.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    final userId =
        Provider.of<AuthProvider>(context, listen: false).getUserId();
    print('user id inside profile : $userId');
    final userProfileProvider =
        Provider.of<UserProfileProvider>(context, listen: false);
    userProfileProvider.getProfileData(userId.toInt());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Consumer<UserProfileProvider>(
                builder: (context, userProfileProvider, child) {
                  return userProfileProvider.isLoading
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: Colors.yellow,
                          ),
                        )
                      : Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Profile',
                                  style: TextStyle(
                                    color: ColorResources.GLOSSY_FLOSSY_YELLOW,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                  ),
                                ),
                                IconButton(
                                  onPressed: onEditButtonPressed,
                                  icon: const Icon(
                                    Icons.edit_note_sharp,
                                    color: ColorResources.GLOSSY_FLOSSY_YELLOW,
                                    size: 24,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              height: 140,
                              width: 140,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.yellow,
                                    width: 1.5,
                                  ),
                                  borderRadius: BorderRadius.circular(70)),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(70),
                                  child: Image.network(
                                    AppConstants.BASE_URL +
                                        userProfileProvider
                                            .message!.userProfilePic,
                                    frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                                      return child;
                                    },
                                    loadingBuilder: (context, child, loadingProgress) {
                                      if (loadingProgress == null) {
                                        return child;
                                      } else {
                                        return const Center(
                                          child: CircularProgressIndicator(
                                            color: ColorResources.GLOSSY_FLOSSY_YELLOW,
                                          ),
                                        );
                                      }
                                    },
                                    fit: BoxFit.cover,
                                  )),
                            ),
                            // CircleAvatar(
                            //   radius: 60,
                            //   backgroundImage: AssetImage(Images.PROFILE_IMAGE),
                            // ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomFieldProfile(
                              name: userProfileProvider.message!.customerName,
                              title: 'Name',
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomFieldProfile(
                              name: userProfileProvider.message!.email,
                              title: 'E-mail',
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomFieldProfile(
                              name: '+91 ${userProfileProvider.message!.phone}',
                              title: 'Phone Number',
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomFieldProfile(
                              name: userProfileProvider.message!.address,
                              title: 'Address',
                            ),
                          ],
                        );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onEditButtonPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UserProfileEditScreen(
          message:
              Provider.of<UserProfileProvider>(context, listen: false).message,
        ),
      ),
    );
  }
}







// Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             children: [
//               Center(
//                 child: CircleAvatar(
//                   radius: 50,
//                   backgroundImage: AssetImage(Images.CAR_WASHING),
//                 ),
//               ),
//               Text(
//                 'Name',
//                 style: TextStyle(
//                     fontStyle: FontStyle.italic,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 15),
//               ),
//             ],
//           ),
//         ),