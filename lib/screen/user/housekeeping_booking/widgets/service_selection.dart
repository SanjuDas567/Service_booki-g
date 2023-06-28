import 'dart:io';

import 'package:flutter/material.dart';
import 'package:glossy_flossy/provider/user/house_keeping_provider.dart';
import 'package:provider/provider.dart';

class CheckboxImageUploadWidget extends StatelessWidget {
  final File? uploadImage;

  const CheckboxImageUploadWidget({super.key, required this.uploadImage});
  @override
  Widget build(BuildContext context) {
    final houseKeepingProviderUser =
        Provider.of<HouseKeepingProviderUser>(context, listen: false);
    return Row(
      children: [
        Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 0.4,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.grey)),
              child: uploadImage == null
                  ? Center(
                      child: IconButton(
                          onPressed: () {
                            houseKeepingProviderUser.getImage();
                          },
                          icon: Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.yellow,
                          )))
                  : Image.file(
                      uploadImage!,
                      fit: BoxFit.cover,
                    ),
            ),
            uploadImage != null
                ? Positioned(
                    top: -7,
                    right: -7,
                    child: IconButton(
                      onPressed: () {
                        houseKeepingProviderUser.removeImage();
                      },
                      icon: Icon(
                        Icons.close,
                        color: Colors.red,
                      ),
                    ),
                  )
                : SizedBox.shrink(),
          ],
        ),
      ],
    );
  }
}
