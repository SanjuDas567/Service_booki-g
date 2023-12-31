import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:glossy_flossy/provider/worker/auth_provider_worker.dart';
import 'package:glossy_flossy/screen/common/user_selection_screeen/user_selection_screen.dart';
import 'package:glossy_flossy/screen/worker/home_screen/home_screen_worker.dart';
import 'package:glossy_flossy/screen/worker/income_screen/income_screen.dart';
import 'package:glossy_flossy/screen/worker/notification_screen/notification_screen_worker.dart';
import 'package:glossy_flossy/screen/worker/profile_screen/profile_screen_worker.dart';
import 'package:glossy_flossy/screen/worker/servise_history/service_history_worker.dart';
import 'package:glossy_flossy/screen/worker/upcoming_work_screen/upcoming_work_screen.dart';
import 'package:glossy_flossy/screen/worker/work_screen/work_locaton_screen.dart';
import 'package:glossy_flossy/utils/images.dart';
import 'package:glossy_flossy/widgets/custom_page_route.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

class MainScreenWorker extends StatefulWidget {
  MainScreenWorker({super.key});

  @override
  State<MainScreenWorker> createState() => _MainScreenWorkerState();
}

class _MainScreenWorkerState extends State<MainScreenWorker> {
  int _selectedScreenIndex = 0;

  final List _screens = [
    {"screen": HomeScreenWorker()},
    {"screen": const UpcomingWork()},
    {"screen": const IncomeScreen()},
    {"screen": const WorkLocationScreen()},
    {"screen": const ProfileScreenWorker()},
  ];

  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    DateTime timeBackPressed = DateTime.now();
    return WillPopScope(
      onWillPop: () async {
        final differeance = DateTime.now().difference(timeBackPressed);
        timeBackPressed = DateTime.now();
        if (differeance >= Duration(seconds: 2)) {
          final String msg = 'Press the back button to exit';
          Fluttertoast.showToast(
            msg: msg,
          );
          return false;
        } else {
          Fluttertoast.cancel();
          SystemNavigator.pop();
          return true;
        }
      },
      child: Scaffold(
        drawer: Drawer(
          backgroundColor: Colors.black,
          child: ListView(
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(color: Colors.yellow),
                curve: Curves.easeInOutCubicEmphasized,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(Images.PROFILE_IMAGE),
                    ),
                    Text('User name'),
                    Text('user@gmail.com'),
                  ],
                ),
              ),
              ListTile(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => ChatListScreen(),
                  //   ),
                  // );
                },
                leading: const Icon(
                  Icons.chat,
                  color: Colors.white,
                ),
                title: const Text(
                  'Chat',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ServiceHistoryWorker(),
                    ),
                  );
                },
                title: Text(
                  'Work History',
                  style: TextStyle(color: Colors.white),
                ),
                leading: Icon(
                  Icons.history,
                  color: Colors.white,
                ),
              ),
              ListTile(
                onTap: () async {
                  final isClear = await Provider.of<AuthProviderWorker>(context,
                          listen: false)
                      .clearAllWorkerData();
                  isClear
                      ? await Navigator.push(
                          context,
                          CustomDownPageRoute(
                              child: UserSelectionScreen(),
                              direction: AxisDirection.up),
                        )
                      : null;
                },
                title: Text(
                  'LogOut',
                  style: TextStyle(color: Colors.white),
                ),
                leading: Icon(
                  Icons.logout_outlined,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Image.asset(
            Images.GLOSSY_FLOSSY_LOGO,
            height: 35,
          ),
          actions: [
            Stack(
              children: [
                IconButton(
                  icon: const Icon(Icons.notifications),
                  tooltip: 'Notification',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NotificationScreenWorker(),
                      ),
                    );
                  },
                ),
                const Positioned(
                  right: 12,
                  top: 12,
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
            ),
          ],
          centerTitle: true,
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          iconSize: 21,
          selectedItemColor: Colors.yellow,
          currentIndex: _selectedScreenIndex,
          backgroundColor: Colors.black,
          // unselectedLabelStyle: TextStyle(color: Colors.white),
          onTap: _selectScreen,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ),
              label: 'Home',
              activeIcon: Icon(Icons.home_rounded),
              // backgroundColor: Colors.white24,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.work_history_outlined,
                color: Colors.white,
              ),
              activeIcon: Icon(Icons.work_history_rounded
              ),
              label: 'Future work',
              // backgroundColor: Colors.white24,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.miscellaneous_services_outlined,
                color: Colors.white,
              ),
              activeIcon: Icon(Icons.miscellaneous_services_outlined),
              label: 'Payment',
              // backgroundColor: Colors.white24,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.work_outline,
                color: Colors.white,
              ),
              label: 'Work',
              activeIcon: Icon(Icons.work_outlined),
              // backgroundColor: Colors.white24,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline_sharp,
                color: Colors.white,
              ),
              label: 'Profile',
              activeIcon: Icon(Icons.person_rounded),
              // backgroundColor: Colors.white24,
            ),
          ],
        ),
        body: _screens[_selectedScreenIndex]["screen"],
      ),
    );
  }
}
