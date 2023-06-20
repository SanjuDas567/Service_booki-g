import 'package:flutter/foundation.dart';
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
                              title: Text("Choose a date to continue"),
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
            subInfoTitle: 'Choose suitable Time',
            // subInfoText: ,
            // subIcon: Icon(Icons.timer),
          )
              // ListView.builder(
              //   shrinkWrap: true,
              //   physics: NeverScrollableScrollPhysics(),
              //   itemCount: 8,
              //   itemBuilder: (context, index) => Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: ExpansionTile(
              //       collapsedBackgroundColor: Colors.yellow,
              //       backgroundColor: Colors.yellow,
              //       leading: ClipRRect(
              //         borderRadius: BorderRadius.circular(12),
              //         child: Image.asset(
              //           Images.CAR_WASHING_IMAGE,
              //           height: 30,
              //         ),
              //       ),
              //       subtitle: Text(
              //         "Wash and wax, Full velvet, Interior velvet",
              //         style: TextStyle(color: Colors.black45),
              //       ),
              //       title: Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Row(
              //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //             children: [
              //               Text(
              //                 'Vehicle Wash',
              //                 style: TextStyle(
              //                     fontSize: 15.0, fontWeight: FontWeight.bold),
              //               ),
              //             ],
              //           ),
              //           Text(
              //             'id : 11545323648',
              //           )
              //         ],
              //       ),
              //       children: <Widget>[
              //         ListTile(
              //           tileColor: Colors.yellow,
              //           title: Text(
              //             '',
              //             style: TextStyle(fontWeight: FontWeight.w700),
              //           ),
              //         )
              //       ],
              //     ),
              //   ),
              // ),
              ),
        ],
      ),
    );
  }

  void showDialogTimePicker(BuildContext context) {
    selectedTime = showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              // primary: MyColors.primary,
              primary: Theme.of(context).colorScheme.primary,
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: Colors.black,
            ),
            //.dialogBackgroundColor:Colors.blue[900],
          ),
          child: child!,
        );
      },
    );
    selectedTime.then((value) {
      setState(() {
        if (value == null) return;
        time = "${value.hour} : ${value.minute}";
      });
    }, onError: (error) {
      if (kDebugMode) {
        print(error);
      }
    });
  }
}


// class DialogFb3 extends StatelessWidget {
//   const DialogFb3({Key? key}) : super(key: key);

//   final primaryColor = const Color(0xff4338CA);
//   final secondaryColor = const Color(0xff6D28D9);
//   final accentColor = const Color(0xffffffff);
//   final backgroundColor = const Color(0xffffffff);
//   final errorColor = const Color(0xffEF4444);

//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       elevation: 1,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//       child: Container(
//         width: MediaQuery.of(context).size.width / 1.5,
//         height: MediaQuery.of(context).size.height / 5,
//         decoration: BoxDecoration(
//           gradient: LinearGradient(colors:[primaryColor, secondaryColor]),
//             borderRadius: BorderRadius.circular(15.0),
//             boxShadow: [
//               BoxShadow(
//                   offset: const Offset(12, 26),
//                   blurRadius: 50,
//                   spreadRadius: 0,
//                   color: Colors.grey.withOpacity(.1)),
//             ]),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             CircleAvatar(
//               backgroundColor: accentColor.withOpacity(.05),
//               radius: 25,
//               child: Image.network(
//                   "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/FlutterBricksLogo-Med.png?alt=media&token=7d03fedc-75b8-44d5-a4be-c1878de7ed52"),
//             ),
//             const SizedBox(
//               height: 15,
//             ),
//              Text("How are you doing?",
//                 style: TextStyle(
//                     color: accentColor,
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold)),
//             const SizedBox(
//               height: 3.5,
//             ),
//              Text("This is a sub text, use it to clarify",
//                 style: TextStyle(
//                     color: accentColor,
//                     fontSize: 12,
//                     fontWeight: FontWeight.w300)),
//             const SizedBox(
//               height: 15,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }