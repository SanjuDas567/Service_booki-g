import 'package:flutter/material.dart';
import 'package:glossy_flossy/screen/admin/login_screen/login_screen_admin.dart';
import 'package:glossy_flossy/utils/images.dart';

class AdminSelectionContainer extends StatelessWidget {
  const AdminSelectionContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.yellow, borderRadius: BorderRadius.circular(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // const SizedBox(
          //   width: 10,
          // ),
          const CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(Images.ADMIN_ICON_USER_SELECTION),
          ),
          const SizedBox(
            width: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Admin Login',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 20,
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
                    child: Text('Continue ->'),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
