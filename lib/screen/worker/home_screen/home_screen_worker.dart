import 'package:flutter/material.dart';
import 'package:glossy_flossy/provider/worker/auth_provider_worker.dart';
import 'package:glossy_flossy/provider/worker/home_screen_worker_provider.dart';
import 'package:glossy_flossy/utils/color_resources.dart';
import 'package:glossy_flossy/utils/custom_fonts.dart';
import 'package:glossy_flossy/utils/dimentions.dart';
import 'package:provider/provider.dart';

import 'widget/info_card.dart';

class HomeScreenWorker extends StatefulWidget {
  HomeScreenWorker({super.key});

  @override
  State<HomeScreenWorker> createState() => _HomeScreenWorkerState();
}

class _HomeScreenWorkerState extends State<HomeScreenWorker> {
  late Future<TimeOfDay?> selectedTime;

  String time = "";

  @override
  Widget build(BuildContext context) {
    final workerName =
        Provider.of<AuthProviderWorker>(context, listen: false).getWorkerName();
    return Consumer<HomeScreenProviderWorker>(
      builder: (context, homeProvider, child) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: RefreshIndicator(
            color: ColorResources.GLOSSY_FLOSSY_YELLOW,
            onRefresh: () async {
              // ignore: avoid_returning_null_for_void
              return null;
            },
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding:
                        const EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Welcome back",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal)),
                                Text(workerName,
                                    style: TextStyle(
                                        color:
                                            ColorResources.GLOSSY_FLOSSY_YELLOW,
                                        fontSize: 26,
                                        fontWeight: FontWeight.bold))
                              ],
                            ),
                            Text(
                              'Work List',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Switch to online before work',
                            style: poppinsSemiBold.copyWith(
                                  color: ColorResources.GLOSSY_FLOSSY_GREY
                                ),),
                            Column(
                              children: [
                                Switch(
                                  // thumb color (round icon)
                                  activeColor: ColorResources.GLOSSY_FLOSSY_YELLOW,
                                  activeTrackColor: ColorResources.GLOSSY_FLOSSY_WHITE,
                                  inactiveThumbColor: Colors.blueGrey.shade600,
                                  inactiveTrackColor: Colors.grey.shade400,
                                  splashRadius: 50.0,
                                  onChanged: (value) {
                                    homeProvider.updateOnlineSwitchValue(value);
                                  },
                                  value: homeProvider.onlineSwitch,
                                ),
                                homeProvider.onlineSwitch
                                ? Text('Online',style: poppinsSemiBold.copyWith(
                                  color: ColorResources.GLOSSY_FLOSSY_YELLOW
                                ),) 
                                : Text('Offline',
                                style: poppinsSemiBold.copyWith(
                                  color: ColorResources.GLOSSY_FLOSSY_WHITE
                                ),)
                                ,
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
                SliverList.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        InfoCard(
                        title: 'Vehicle',
                        body: "Wash and wax, Full velvet, Interior velvet",
                        onMoreTap: () {
                          Provider.of<HomeScreenProviderWorker>(context,
                                          listen: false)
                                      .time ==
                                  ''
                              ? showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                          title: Text("Message"),
                                          content:
                                              Text('Choose a date to continue'),
                                          backgroundColor: Colors.yellow.shade400,
                                          // description: "This will save all your profile settings.",
                                          actions: [
                                            // TextButton(
                                            //   onPressed: () {
                                            //     Navigator.pop(context);
                                            //   },
                                            //   child: Text('CANCEL'),
                                            // ),
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text('Ok'),
                                            ),
                                          ]))
                              : showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                          title: Text("Message"),
                                          content: Text('Work accepted'),
                                          backgroundColor: Colors.yellow.shade400,
                                          // description: "This will save all your profile settings.",
                                          actions: [
                                            // TextButton(
                                            //   onPressed: () {
                                            //     Navigator.pop(context);
                                            //   },
                                            //   child: Text('CANCEL'),
                                            // ),
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text('Ok'),
                                            ),
                                          ]));
                          print('more button is pressed');
                        },
                        subInfoTitle: 'Date And Time',
                        // subInfoText: ,
                        // subIcon: Icon(Icons.date_range_outlined),
                  ),
                  SizedBox(
                    child: Divider(
                      color: ColorResources.GLOSSY_FLOSSY_GREY,
                    ),
                    height: 20,
                  ),
                      ],
                    );
                  },
                  
                ),
              ],
            ),
          ),
        );
      },
    );
  }

//   void showDialogTimePicker(BuildContext context) {
//     selectedTime = showTimePicker(
//       context: context,
//       initialTime: TimeOfDay.now(),
//       builder: (BuildContext context, Widget? child) {
//         return Theme(
//           data: ThemeData.light().copyWith(
//             colorScheme: ColorScheme.light(
//               // primary: MyColors.primary,
//               primary: Theme.of(context).colorScheme.primary,
//               onPrimary: Colors.white,
//               surface: Colors.white,
//               onSurface: Colors.black,
//             ),
//             //.dialogBackgroundColor:Colors.blue[900],
//           ),
//           child: child!,
//         );
//       },
//     );
//     selectedTime.then((value) {
//       setState(() {
//         if (value == null) return;
//         time = "${value.hour} : ${value.minute}";
//       });
//     }, onError: (error) {
//       if (kDebugMode) {
//         print(error);
//       }
//     });
//   }
}
