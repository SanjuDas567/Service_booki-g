import 'package:flutter/material.dart';
import 'package:glossy_flossy/screen/worker/work_screen/widget/custom_button.dart';
import 'package:glossy_flossy/screen/worker/work_screen/work_screen.dart';

class WorkLocationScreen extends StatelessWidget {
  const WorkLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Place as the child widget of a scaffold
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/map image.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            LoadingAnimatedButton(
              child: Text(
                "Reached location",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              color: Colors.black,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WorkScreenWorker(),
                  ),
                );
              },
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ), // Place child here
      ),
    );
  }
}
