import 'package:flutter/material.dart';
import 'package:glossy_flossy/screen/worker/login_screen_worker/login_screen_worker.dart';
import 'package:glossy_flossy/utils/images.dart';

class WorkerSelectionContainer extends StatelessWidget {
  const WorkerSelectionContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 4.5,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.yellow, borderRadius: BorderRadius.circular(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage(Images.WORKER_iCON_USER_SELECTION),
          ),
          const Text(
            'Worker Login',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginPageWorker(),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    style: BorderStyle.solid,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8)),
              child: const Padding(
                padding: EdgeInsets.all(4),
                child: Text('Continue ->'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
