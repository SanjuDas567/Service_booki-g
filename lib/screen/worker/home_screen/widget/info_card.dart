import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:glossy_flossy/provider/worker/home_screen_worker_provider.dart';
import 'package:provider/provider.dart';

class InfoCard extends StatefulWidget {
  final String title;
  final String body;
  final Function() onMoreTap;

  final String subInfoTitle;
  final String subInfoText;
  final Widget subIcon;

  InfoCard(
      {required this.title,
      this.body =
          """Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia, molestiae quas vel sint commodi repudi conseqr!""",
      required this.onMoreTap,
      this.subIcon = const CircleAvatar(
        child: Icon(
          Icons.timer,
          color: Colors.white,
        ),
        backgroundColor: Colors.orange,
        radius: 25,
      ),
      this.subInfoText = "Select time",
      this.subInfoTitle = "Choose suitable time",
      Key? key})
      : super(key: key);

  @override
  State<InfoCard> createState() => _InfoCardState();
}

class _InfoCardState extends State<InfoCard> {
  late HomeScreenProviderWorker homeScreenProviderWorker;

  late Future<TimeOfDay?> selectedTime;

  String time = "";

  @override
  void dispose() {
    homeScreenProviderWorker.setTime('');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    homeScreenProviderWorker =
        Provider.of<HomeScreenProviderWorker>(context, listen: false);
    return Container(
      padding: EdgeInsets.all(25.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.05),
              offset: Offset(0, 10),
              blurRadius: 0,
              spreadRadius: 0,
            )
          ],
          gradient: RadialGradient(
            colors: [Colors.orangeAccent, Colors.orange],
            focal: Alignment.topCenter,
            radius: .85,
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                width: 75,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.0),
                  gradient: LinearGradient(
                      colors: [Colors.white, Colors.white],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter),
                ),
                child: GestureDetector(
                  onTap: widget.onMoreTap,
                  child: Center(
                      child: Text(
                    "Accept",
                    style: TextStyle(color: Colors.orange),
                  )),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            widget.body,
            style:
                TextStyle(color: Colors.white.withOpacity(.75), fontSize: 14),
          ),
          SizedBox(height: 15),
          Consumer<HomeScreenProviderWorker>(
            builder: (context, homeScreenProviderWorker, child) {
              return Container(
                width: double.infinity,
                height: 75,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      showDialogTimePicker(context);
                    },
                    child: Row(
                      children: [
                        widget.subIcon,
                        SizedBox(width: 10),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.subInfoTitle),
                            Text(
                              homeScreenProviderWorker.time,
                              style: TextStyle(
                                color: Colors.orange,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          )
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
              // primary: Theme.of(context).colorScheme.primary,
              onPrimary: Colors.black,
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
      time = "${value?.hour} : ${value?.minute}";
      Provider.of<HomeScreenProviderWorker>(context, listen: false)
          .setTime(time);
    }, onError: (error) {
      if (kDebugMode) {
        print(error);
      }
    });
  }
}
