import 'package:flutter/material.dart';
import 'package:glossy_flossy/provider/worker/auth_provider_worker.dart';
import 'package:glossy_flossy/provider/worker/profile_provider_worker.dart';
import 'package:glossy_flossy/screen/worker/profile_screen/widgets/employee_card.dart';
import 'package:glossy_flossy/screen/worker/profile_screen/widgets/field_to_show_details_worker.dart';
import 'package:glossy_flossy/utils/color_resources.dart';
import 'package:glossy_flossy/utils/images.dart';
import 'package:provider/provider.dart';

class ProfileScreenWorker extends StatefulWidget {
  const ProfileScreenWorker({super.key});

  @override
  State<ProfileScreenWorker> createState() => _ProfileScreenWorkerState();
}

class _ProfileScreenWorkerState extends State<ProfileScreenWorker> {
  @override
  void initState() {
    // TODO: implement
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getworkerData();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Consumer<ProfileProviderWorker>(
          builder: (context, profileProviderWorker, child) {
            // WorkerCard card = profileProviderWorker.workerCard![0];
            // Screen screen = profileProviderWorker.screen![0];
            return profileProviderWorker.isProfileLoading
                ? Center(
                    child: CircularProgressIndicator(
                      color: ColorResources.GLOSSY_FLOSSY_YELLOW,
                    ),
                  )
                : CustomScrollView(
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
                              EmployeeCard(
                                card: profileProviderWorker.workerCard![0],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              CustomFieldProfileWorker(
                                name: profileProviderWorker
                                    .workerCard![0].empName,
                                title: 'Name',
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              CustomFieldProfileWorker(
                                name: profileProviderWorker.screen![0].empPhone,
                                title: 'Phone Number',
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              CustomFieldProfileWorker(
                                name: profileProviderWorker
                                    .screen![0].empLocation,
                                title: 'Location',
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              CustomFieldProfileWorker(
                                name: profileProviderWorker.screen![0].empEmail,
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
                                name: profileProviderWorker
                                    .screen![0].triningCourse,
                                title: 'Training Course',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
          },
        ));
  }

  void getworkerData() async {
    final workerId =
        Provider.of<AuthProviderWorker>(context, listen: false).getWorkerId();
    print(workerId);
    Provider.of<ProfileProviderWorker>(context, listen: false)
        .getWorkerDetails(workerId);
  }
}
