import 'package:flutter/material.dart';
import 'package:glossy_flossy/screen/user/login_page/login_page.dart';
import 'package:glossy_flossy/utils/images.dart';

class UserSelectionContainer extends StatelessWidget {
  const UserSelectionContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 4.5,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.yellow, borderRadius: BorderRadius.circular(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(Images.USER_iCON_USER_SELECTION),
          ),
          const SizedBox(
            width: 20,
          ),
          const Text(
            'User Login',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(
            width: 20,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
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
          )
        ],
      ),
    );
  }
}
