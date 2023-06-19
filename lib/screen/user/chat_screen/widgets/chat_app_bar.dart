import 'package:flutter/material.dart';

class ChatScreenAppBar extends StatelessWidget {
  final String name;
  const ChatScreenAppBar({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.black,
      pinned: true,
      iconTheme: IconThemeData(color: Colors.white),
      title: Text(name),
    );
    ;
  }
}
