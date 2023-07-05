import 'package:flutter/material.dart';
import 'package:glossy_flossy/screen/worker/servise_history/work_details_screen.dart';

class ServiceHistoryWorker extends StatelessWidget {
  const ServiceHistoryWorker({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Work History',
                style: TextStyle(
                    color: Colors.yellow,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
          ),
          SliverList.separated(
            itemCount: 20,
            itemBuilder: (context, index) {
              return ListTile(
                  leading: Text(
                    '${index + 1}',
                    style: TextStyle(color: Colors.white),
                  ),
                  title: Text(
                    'Vehicle Wash',
                    style: TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(
                    '20/06/2023',
                    style: TextStyle(color: Colors.white),
                  ),
                  trailing: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WorkDetailsScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'Show more >',
                      style: TextStyle(color: Colors.yellow),
                    ),
                  ));
            },
            separatorBuilder: (context, index) {
              return Divider(
                thickness: 1,
                color: Colors.grey,
              );
            },
          )
        ],
      ),
    );
  }
}
