import 'package:flutter/material.dart';
import 'package:glossy_flossy/utils/images.dart';

class NotificationListWorker extends StatelessWidget {
  const NotificationListWorker({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(bottom: 30, top: 26),
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 20,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            leading: CircleAvatar(
              radius: 21.5,
              backgroundColor: Colors.yellow,
              child: CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage(
                  Images.CAR_WASHING,
                ),
              ),
            ),
            tileColor: Colors.white,
            title: Text(
              'Car Washing',
              // style: TextStyle(color: Colors.white),
            ),
            subtitle: Text('Tap to accept work and see work details'),
          ),
        );
      },
    );
  }
}
