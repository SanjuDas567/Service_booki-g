import 'package:flutter/material.dart';
import 'package:glossy_flossy/screen/worker/notification_screen/widgets/notification_list_worker.dart';
import 'package:glossy_flossy/widgets/custom_app_bar.dart';

class NotificationScreenWorker extends StatelessWidget {
  const NotificationScreenWorker({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: CustomScrollView(
          slivers: [
            CustomAppBar(isBackButton: 1, isNotification: 1),
            SliverToBoxAdapter(child: NotificationListWorker(),),
          ],
        ));
  }
}
