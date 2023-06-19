import 'package:flutter/material.dart';
import 'package:glossy_flossy/screen/user/chat_screen/chat_screen.dart';
import 'package:glossy_flossy/utils/images.dart';
import 'package:glossy_flossy/widgets/custom_app_bar.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          CustomAppBar(isBackButton: 1, isNotification: 1),
          SliverToBoxAdapter(
            child: ListView.separated(
              itemCount: 1,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatScreen(
                          name: 'name',
                        ),
                      ),
                    );
                  },
                  title: Text(
                    'name',
                    style: TextStyle(color: Colors.yellow),
                  ),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(Images.CAR_WASHING),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  color: Colors.grey.shade700,
                  thickness: .5,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
