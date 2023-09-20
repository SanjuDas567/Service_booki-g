import 'package:flutter/material.dart';
import 'package:glossy_flossy/screen/common/user_selection_screeen/widgets/admin_selection_container.dart';
import 'package:glossy_flossy/screen/common/user_selection_screeen/widgets/user_selection_container.dart';
import 'package:glossy_flossy/screen/common/user_selection_screeen/widgets/worker_selection_container.dart';
import 'package:glossy_flossy/utils/images.dart';

class UserSelectionScreen extends StatelessWidget {
  const UserSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child:  Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Select \nuser type',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Image.asset(Images.GLOSSY_FLOSSY_LOGO,
                      height: MediaQuery.of(context).size.height / 15,),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),

                  //user login container:-----------------------------------------
                  UserSelectionContainer(),
                  SizedBox(
                    height: 20,
                  ),

                  //worker login container:---------------------------------------
                  WorkerSelectionContainer(),
                  SizedBox(
                    height: 20,
                  ),

                  //admin login container:----------------------------------------
                  AdminSelectionContainer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
