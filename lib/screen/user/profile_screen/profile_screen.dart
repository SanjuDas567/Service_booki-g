import 'package:flutter/material.dart';
import 'package:glossy_flossy/screen/user/profile_screen/widgets/field_to_show_details.dart';
import 'package:glossy_flossy/utils/images.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: CustomScrollView(
        slivers: [
          
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
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
                        child: Image.asset(
                          Images.PROFILE_IMAGE,
                          fit: BoxFit.cover,
                        )),
                  ),
                  // CircleAvatar(
                  //   radius: 60,
                  //   backgroundImage: AssetImage(Images.PROFILE_IMAGE),
                  // ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomFieldProfile(
                    name: 'Sharron',
                    title: 'Name',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomFieldProfile(
                    name: 'sharron@gmail.com',
                    title: 'E-mail',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomFieldProfile(
                    name: '654782136494',
                    title: 'Phone Number',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomFieldProfile(
                    name: 'UK',
                    title: 'Location',
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
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