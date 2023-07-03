import 'dart:io';

import 'package:flutter/material.dart';
import 'package:glossy_flossy/provider/worker/worker_details_provider_worker.dart';
import 'package:provider/provider.dart';
import 'widget/image_adding_widget.dart';

class WorkScreenWorker extends StatelessWidget {
  const WorkScreenWorker({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text("Work details"),
            backgroundColor: Colors.black,
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Text('sel'),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                
                Consumer<WorkerDetailsProvider>(
                  builder: (context, workerDetailsProvider, child) {
                    File? image = workerDetailsProvider.selectedImage1;
                    return ImageAddingWidgwtWorker(
                      uploadImage: image,
                      callback: () {
                        workerDetailsProvider.getImage();
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
