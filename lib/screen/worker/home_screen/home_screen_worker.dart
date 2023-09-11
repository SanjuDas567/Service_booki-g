import 'package:flutter/material.dart';
import 'package:glossy_flossy/provider/worker/home_screen_worker_provider.dart';
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
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                Text(
                  'Work List',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: InfoCard(
              title: 'Vehicle',
              body: "Wash and wax, Full velvet, Interior velvet",
              onMoreTap: () {
                Provider.of<HomeScreenProviderWorker>(context, listen: false)
                            .time ==
                        ''
                    ? showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                                title: Text("Message"),
                                content: Text('Choose a date to continue'),
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
          ),
        ],
      ),
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
