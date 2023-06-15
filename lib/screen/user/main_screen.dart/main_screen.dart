import 'package:flutter/material.dart';
import 'package:glossy_flossy/screen/user/chat_screen/chat_screen.dart';
import 'package:glossy_flossy/screen/user/home_screen.dart/home_screen.dart';
import 'package:glossy_flossy/screen/user/profile_screen/profile_screen.dart';

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
      backgroundColor: Colors.black,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(25)),
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
                label: 'chat',
                backgroundColor: Colors.white24,
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_outline_sharp,
                  color: Colors.white,
                ),
                label: 'chat',
                activeIcon: Icon(Icons.person_rounded),
                backgroundColor: Colors.white24,
              ),
            ],
          ),
        ),
      ),
      body: _screens[_selectedScreenIndex]["screen"],
    );
  }
}
