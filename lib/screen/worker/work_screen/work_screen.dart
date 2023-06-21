import 'package:flutter/material.dart';
import 'package:glossy_flossy/utils/images.dart';

class WorkScreenWorker extends StatelessWidget {
  const WorkScreenWorker({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Place as the child widget of a scaffold
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                title: Text("Work details"),
                backgroundColor: Colors.black,
              ),
              // SliverToBoxAdapter(
              //   child: Text(
              //     'Work details',
              //     style: TextStyle(
              //         color: Colors.white,
              //         fontSize: 20,
              //         fontWeight: FontWeight.bold),
              //   ),
              // ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      clipBehavior: Clip.hardEdge,
                      height: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: LinearGradient(
                              colors: [Colors.orange.shade200, Colors.orange])),
                      child: Stack(
                        children: [
                          Image.asset(Images.WORKER_iCON_USER_SELECTION),
                          const Align(
                            alignment: Alignment.topRight,
                            child: Padding(
                              padding: EdgeInsets.all(25.0),
                              child: Text(
                                "Add before\nwork image",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
