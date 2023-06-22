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
        // ElevatedButton(
        //   onPressed: () {
        //     houseKeepingProviderUser.getImage();
        //   },
        //   child: Text('Select Image'),
        // ),
        Stack(children: [
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
        ]),
      ],
    );
  }

  // void selectImage(BuildContext context, ImageSource source, int index) async {
  //   final picker = ImagePicker();
  //   final pickedImage = await picker.pickImage(source: source);
  //   if (pickedImage != null) {
  //     Provider.of<HouseKeepingProviderUser>(context, listen: false)
  //         .setImage(File(pickedImage as String), index);
  //   }
  // }
}













// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:glossy_flossy/provider/house_keeping_provider.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:provider/provider.dart';

// class CustomForm extends StatelessWidget {
//   final String title;
//   final bool isChecked;
//   final VoidCallback onToggle;
//   final VoidCallback pickImage;
//   final File? image;

//   const CustomForm({
//     required this.isChecked,
//     required this.onToggle,
//     required this.title,
//     required this.image, 
//     required this.pickImage,
//   });

//   void selectImage(BuildContext context, ImageSource source,
//       HouseKeepingProviderUser houseKeepingProviderUser) async {
//     final picker = ImagePicker();
//     final pickedImage = await picker.getImage(source: source);
//     if (pickedImage != null) {
//       houseKeepingProviderUser.setImage1(File(pickedImage.path));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         SizedBox(
//           height: 20,
//         ),
//         // Consumer<HouseKeepingProviderUser>(
//         //   builder: (context, houseKeepingProviderUser, child) =>
//         //       GestureDetector(
//         //     onTap: onToggle,
//         //     child: Container(
//         //       width: 24.0,
//         //       height: 24.0,
//         //       decoration: BoxDecoration(
//         //         shape: BoxShape.circle,
//         //         border: Border.all(color: Colors.grey),
//         //         color: isChecked ? Colors.blue : Colors.transparent,
//         //       ),
//         //       child: isChecked
//         //           ? Icon(
//         //               Icons.check,
//         //               color: Colors.white,
//         //               size: 18.0,
//         //             )
//         //           : null,
//         //     ),
//         //   ),
//         // ),
//         SizedBox(height: 16.0),
//         Consumer<HouseKeepingProviderUser>(
//           builder: (context, imageProvider, _) {
//             File? selectedImage = image;

//             return InkWell(
//               onTap: () {
//                 showDialog(
//                   context: context,
//                   builder: (BuildContext context) {
//                     return AlertDialog(
//                       title: Text('Choose an image'),
//                       actions: [
//                         TextButton(
//                           onPressed: () {
//                             Navigator.of(context).pop();
//                           },
//                           child: Text('Cancel'),
//                         ),
//                       ],
//                       content: SingleChildScrollView(
//                         child: ListBody(
//                           children: [
//                             ListTile(
//                               leading: Icon(Icons.photo_library),
//                               title: Text('Gallery'),
//                               onTap: () {
//                                 selectImage(context, ImageSource.gallery,
//                                     imageProvider);
//                                 Navigator.of(context).pop();
//                               },
//                             ),
//                             ListTile(
//                               leading: Icon(Icons.camera_alt),
//                               title: Text('Camera'),
//                               onTap: () {
//                                 selectImage(
//                                     context, ImageSource.camera, imageProvider);
//                                 Navigator.of(context).pop();
//                               },
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 );
//               },
//               child: Container(
//                 width: 120.0,
//                 height: 120.0,
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.grey),
//                   borderRadius: BorderRadius.circular(8.0),
//                 ),
//                 child: image != null
//                     ? Image.file(image.)
//                     : Icon(
//                         Icons.camera_alt,
//                         color: Colors.grey,
//                         size: 48.0,
//                       ),
//               ),
//             );
//           },
//         ),
//       ],
//     );
//   }
// }