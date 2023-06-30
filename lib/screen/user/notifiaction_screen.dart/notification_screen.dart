import 'package:flutter/material.dart';
import 'package:glossy_flossy/screen/user/notifiaction_screen.dart/widgets/notifiction_expantion_card.dart';
import 'package:glossy_flossy/widgets/custom_app_bar.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: CustomScrollView(
          slivers: [
            CustomAppBar(isBackButton: 1, isNotification: 1),
            SliverToBoxAdapter(
              child: NotificationExpantionPanel(),
            ),
          ],
        ));
  }
}
