import 'package:flutter/material.dart';
import 'package:glossy_flossy/screen/admin/login_screen/login_screen_admin.dart';
import 'package:glossy_flossy/utils/color_resources.dart';
import 'package:glossy_flossy/utils/images.dart';

class AdminSelectionContainer extends StatelessWidget {
  const AdminSelectionContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 4.5,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: ColorResources.GLOSSY_FLOSSY_YELLOW,
          borderRadius: BorderRadius.circular(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundColor: ColorResources.GLOSSY_FLOSSY_BLACK,
                backgroundImage: AssetImage(
                  Images.ADMIN_SELECTION_ADMIN_ICON,
                ),
              ),
              Text(
                'Admin Login',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginPageAdmin(),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    style: BorderStyle.solid,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8)),
              child: const Padding(
                padding: EdgeInsets.all(4),
                child: Text('Sign In'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
