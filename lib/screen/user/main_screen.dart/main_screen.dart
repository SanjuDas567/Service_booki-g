import 'package:flutter/material.dart';
import 'package:glossy_flossy/screen/user/chat_screen/chat_screen.dart';
import 'package:glossy_flossy/screen/user/home_screen.dart/home_screen.dart';
import 'package:glossy_flossy/screen/user/profile_screen/profile_screen.dart';
import 'package:glossy_flossy/utils/images.dart';
import 'package:glossy_flossy/widgets/custom_app_bar.dart';

class MainScreen extends StatefulWidget {
  MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedScreenIndex = 0;

  final List _screens = [
    {"screen": const HomeScreen()},
    {"screen": const ChatScreen()},
    {"screen": const ProfileScreen()}
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
              title: Text(
                'Item 1',
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
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
                onPressed: () {/* ... */},
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
            BottomNavigationBarItem(
              icon: Icon(
                Icons.chat_bubble_outline,
                color: Colors.white,
              ),
              activeIcon: Icon(Icons.chat_outlined),
              label: 'Chat',
              backgroundColor: Colors.white24,
            ),
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
    );
  }
}
