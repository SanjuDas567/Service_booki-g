import 'package:flutter/material.dart';
import 'package:glossy_flossy/screen/worker/profile_screen/widgets/employee_card.dart';
import 'package:glossy_flossy/screen/worker/profile_screen/widgets/field_to_show_details_worker.dart';
import 'package:glossy_flossy/utils/images.dart';

class ProfileScreenWorker extends StatelessWidget {
  const ProfileScreenWorker({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: CustomScrollView(
          physics: BouncingScrollPhysics(),
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
                    SizedBox(
                      height: 20,
                    ),
                    EmployeeCard(),
                    SizedBox(
                      height: 20,
                    ),
                    CustomFieldProfileWorker(
                      name: 'Sharron',
                      title: 'Name',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomFieldProfileWorker(
                      name: '654782136494',
                      title: 'Phone Number',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomFieldProfileWorker(
                      name: 'UK',
                      title: 'Location',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomFieldProfileWorker(
                      name: 'sharron@gmail.com',
                      title: 'E-mail',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomFieldProfileWorker(
                      name: 'shan123',
                      title: 'Password',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomFieldProfileWorker(
                      name: 'Completed',
                      title: 'Training Course',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
