import 'package:flutter/material.dart';
import 'package:glossy_flossy/provider/user/login_provider_user.dart';
import 'package:glossy_flossy/screen/common/user_selection_screeen/user_selection_screen.dart';
import 'package:glossy_flossy/screen/user/add_vehicle_screen/add_vehicle_screen.dart';
import 'package:glossy_flossy/screen/user/chat_screen/chat_list_selection_screen.dart';
import 'package:glossy_flossy/screen/user/home_screen.dart/home_screen.dart';
import 'package:glossy_flossy/screen/user/notifiaction_screen.dart/notification_screen.dart';
import 'package:glossy_flossy/screen/user/profile_screen/profile_screen.dart';
import 'package:glossy_flossy/screen/user/review_screen/review_screen.dart';
import 'package:glossy_flossy/screen/user/service_history_screen/service_history_screen.dart';
import 'package:glossy_flossy/utils/images.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedScreenIndex = 0;

  final List _screens = [
    {"screen": const HomeScreen()},
    // {"screen": const ChatScreen()},
    {"screen": const ProfileScreen()}
  ];

  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        drawer: Drawer(
          backgroundColor: Colors.black,
          child: ListView(
            children: [
              DrawerHeader(
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatListScreen(),
                    ),
                  );
                },
                leading: Icon(
                  Icons.chat,
                  color: Colors.white,
                ),
                title: Text(
                  'Chat',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ListTile(
                leading: Image.asset(
                  Images.CAR_WASH_ICON,
                  color: Colors.white,
                  width: 30,
                ),
                title: Text(
                  'Add Vehicle',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddVehicleScreen()),
                  );
                },
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ReviewScreen(),
                    ),
                  );
                },
                leading: Icon(
                  Icons.reviews_outlined,
                  color: Colors.white,
                ),
                title: Text(
                  'Review Screen',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ServiceHistoryScreen(),
                    ),
                  );
                },
                leading: Icon(
                  Icons.history,
                  color: Colors.white,
                ),
                title: Text(
                  'Service History',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ListTile(
                onTap: () async {
                  final isClear =
                      await Provider.of<AuthProvider>(context, listen: false)
                          .clearAllData();
                  isClear
                      ? await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UserSelectionScreen(),
                          ),
                        )
                      : null;
                },
                leading: Icon(
                  Icons.logout_outlined,
                  color: Colors.white,
                ),
                title: Text(
                  'LogOut',
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
                        builder: (context) => NotificationScreen(),
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
        backgroundColor: Colors.black,
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BottomNavigationBar(
            iconSize: 21,
            selectedItemColor: Colors.yellow,
            currentIndex: _selectedScreenIndex,
            backgroundColor: Colors.transparent,
            onTap: _selectScreen,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                label: 'Home',
                activeIcon: Icon(Icons.home_rounded),
                backgroundColor: Colors.white24,
              ),
              // BottomNavigationBarItem(
              //   icon: Icon(
              //     Icons.chat_bubble_outline,
              //     color: Colors.white,
              //   ),
              //   activeIcon: Icon(Icons.chat_outlined),
              //   label: 'Chat',
              //   backgroundColor: Colors.white24,
              // ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_outline_sharp,
                  color: Colors.white,
                ),
                label: 'Profile',
                activeIcon: Icon(Icons.person_rounded),
                backgroundColor: Colors.white24,
              ),
            ],
          ),
        ),
        body: _screens[_selectedScreenIndex]["screen"],
      ),
    );
  }
}
