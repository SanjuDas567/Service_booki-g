import 'dart:io';

import 'package:flutter/material.dart';
import 'package:glossy_flossy/provider/worker/worker_details_provider_worker.dart';
import 'package:provider/provider.dart';

class ImageAddingWidgwtWorker extends StatelessWidget {
  final File? uploadImage;
  VoidCallback? callback;
  ImageAddingWidgwtWorker({super.key, this.uploadImage, this.callback});

  @override
  Widget build(BuildContext context) {
    final workerDetailsProvider =
        Provider.of<WorkerDetailsProvider>(context, listen: false);
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            // final imageProvider = Provider.of<ImageProvider>(context, listen: false);
            workerDetailsProvider.selectImages();
          },
          child: Text('Select Images'),
        ),
        Consumer<WorkerDetailsProvider>(
          builder: (context, workerDetailsProvider, _) {
            final selectedImages = workerDetailsProvider.selectedImages;
            return GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: selectedImages.length,
              itemBuilder: (context, index) {
                final imageFile = selectedImages[index];
                return Image.file(
                  imageFile,
                  height: 50,
                );
              },
            );
          },
        ),
      ],
    );

    // Row(
    //   children: [
    //     Stack(
    //       children: [
    //         Container(
    //           height: MediaQuery.of(context).size.height * 0.2,
    //           width: MediaQuery.of(context).size.width * 0.4,
    //           clipBehavior: Clip.hardEdge,
    //           decoration: BoxDecoration(
    //               borderRadius: BorderRadius.circular(15),
    //               border: Border.all(color: Colors.grey)),
    //           child: uploadImage == null
    //               ? Center(
    //                   child: IconButton(
    //                       onPressed: callback,
    //                       icon: Icon(
    //                         Icons.camera_alt_outlined,
    //                         color: Colors.yellow,
    //                       )))
    //               : Image.file(
    //                   uploadImage!,
    //                   fit: BoxFit.cover,
    //                 ),
    //         ),
    //         uploadImage != null
    //             ? Positioned(
    //                 top: -7,
    //                 right: -7,
    //                 child: IconButton(
    //                   onPressed: () {
    //                     workerDetailsProvider.removeImage();
    //                   },
    //                   icon: Icon(
    //                     Icons.close,
    //                     color: Colors.red,
    //                   ),
    //                 ),
    //               )
    //             : SizedBox.shrink(),
    //       ],
    //     ),
    //   ],
    // );
  }
}
