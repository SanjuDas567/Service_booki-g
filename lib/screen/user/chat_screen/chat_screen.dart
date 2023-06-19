import 'package:flutter/material.dart';
import 'package:glossy_flossy/screen/user/chat_screen/widgets/chat_app_bar.dart';
import 'package:glossy_flossy/screen/user/chat_screen/widgets/message_type_widget.dart';
import 'package:glossy_flossy/widgets/custom_app_bar.dart';

import 'widgets/in_buble_design.dart';
import 'widgets/out_buble_design.dart';

class ChatScreen extends StatelessWidget {
  final String name;
  const ChatScreen({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          ChatScreenAppBar(
            name: name,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: const [
                  InBubble(message: 'Hello'),
                  OutBubble(message: 'Hi there'),
                  OutBubble(message: 'How it going?'),
                  InBubble(message: 'Everything is OK'),
                  OutBubble(message: 'Goodbye'),
                  InBubble(message: 'See you soon'),
                ],
              ),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: true,
            child: MessageTypingField(),
          ),
          // SliverToBoxAdapter(
          //   child: MessageTypingField(),
          // ),
        ],
      ),
    );
  }
}
