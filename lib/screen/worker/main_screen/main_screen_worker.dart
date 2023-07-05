import 'package:flutter/material.dart';
import 'package:glossy_flossy/screen/worker/home_screen/home_screen_worker.dart';
import 'package:glossy_flossy/screen/worker/notification_screen/notification_screen_worker.dart';
import 'package:glossy_flossy/screen/worker/profile_screen/profile_screen_worker.dart';
import 'package:glossy_flossy/screen/worker/servise_history/service_history_worker.dart';
import 'package:glossy_flossy/screen/worker/work_screen/work_locaton_screen.dart';
import 'package:glossy_flossy/utils/images.dart';

class MainScreenWorker extends StatefulWidget {
  MainScreenWorker({super.key});

  @override
  State<MainScreenWorker> createState() => _MainScreenWorkerState();
}

class _MainScreenWorkerState extends State<MainScreenWorker> {
  int _selectedScreenIndex = 0;

  final List _screens = [
    {"screen": HomeScreenWorker()},
    // {"screen": const ChatScreen()},
    {"screen": const ServiceHistoryWorker()},
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
    return Scaffold(
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
            const ListTile(
              title: Text(
                'Item 2',
                style: TextStyle(color: Colors.white),
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
              Icons.miscellaneous_services_outlined,
              color: Colors.white,
            ),
            activeIcon: Icon(Icons.miscellaneous_services_outlined),
            label: 'Working History',
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
    );
  }
}
