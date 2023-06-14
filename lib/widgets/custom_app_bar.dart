import 'package:flutter/material.dart';
import 'package:glossy_flossy/utils/images.dart';

class CustomAppBar extends StatelessWidget {
  int isNotification;
  int isBackButton;
  CustomAppBar({required this.isBackButton, required this.isNotification});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.black,
      iconTheme: IconThemeData(color: Colors.white),
      // leading: InkWell(
      //   onTap: () {
      //     // Drawer(
      //     //   child: Column(
      //     //     children: <Widget>[
      //     //       DrawerHeader(
      //     //         child: Text(' I am Drawer'),
      //     //         curve: SawTooth(12),
      //     //       ),
      //     //     ],
      //     //   ),
      //     // );
      //   },
      //   child: Icon(
      //     isBackButton == 0 ? Icons.menu : Icons.arrow_back_ios,
      //     color: Colors.yellow,
      //   ),
      // ),
      title: Center(
        child: Image.asset(
          Images.GLOSSY_FLOSSY_LOGO,
          height: 35,
        ),
      ),
      // flexibleSpace: const FlexibleSpaceBar(
      //   title: Text(
      //     'Glossy Flossy',
      //     style: TextStyle(color: Colors.yellow),
      //   ),
      // ),
      actions: <Widget>[
        isNotification == 0
            ? Stack(
                children: [
                  IconButton(
                    icon: const Icon(Icons.notifications),
                    tooltip: 'Add new entry',
                    onPressed: () {/* ... */},
                  ),
                  const Positioned(
                    right: 8,
                    top: 8,
                    child: CircleAvatar(
                      radius: 5.5,
                      backgroundColor: Colors.yellow,
                      child: Center(
                        child: Text(
                          '6',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 11,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )
            : SizedBox.shrink(),
      ],
    );
  }
}
