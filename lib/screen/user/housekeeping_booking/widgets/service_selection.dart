import 'dart:io';

import 'package:flutter/material.dart';
import 'package:glossy_flossy/provider/house_keeping_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class CheckboxImageUploadWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(6, (index) {
        return Column(
          children: [
            CheckboxListTile(
              value: Provider.of<HouseKeepingProviderUser>(context)
                  .checkboxes[index],
              onChanged: (value) {
                Provider.of<HouseKeepingProviderUser>(context, listen: false)
                    .toggleCheckbox(index);
              },
              title: Text('Checkbox ${index + 1}'),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Container(
                    // margin: EdgeInsets.symmetric(vertical: 10),
                    // width: 24.0,
                    // height: 24.0,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Consumer<HouseKeepingProviderUser>(
                      builder: (context, provider, _) {
                        File? image = provider.images[index];

                        return image != null
                            ? Image.file(
                                image ,
                                fit: BoxFit.cover,
                              )
                            : Center(
                                child: Text(
                                  'No Image',
                                  style: TextStyle(
                                    color: Colors.yellow,
                                  ),
                                ),
                              );
                      },
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.clear,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    Provider.of<HouseKeepingProviderUser>(context,
                            listen: false)
                        .removeImage(index);
                  },
                ),
              ],
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Choose an image'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Cancel'),
                        ),
                      ],
                      content: SingleChildScrollView(
                        child: ListBody(
                          children: [
                            ListTile(
                              leading: Icon(Icons.photo_library),
                              title: Text('Gallery'),
                              onTap: () {
                                selectImage(
                                  context,
                                  ImageSource.gallery,
                                  Provider.of<HouseKeepingProviderUser>(context,
                                          listen: false)
                                      .checkboxes
                                      .indexOf(true),
                                );
                                Navigator.of(context).pop();
                              },
                            ),
                            ListTile(
                              leading: Icon(Icons.camera_alt),
                              title: Text('Camera'),
                              onTap: () {
                                selectImage(
                                  context,
                                  ImageSource.camera,
                                  Provider.of<HouseKeepingProviderUser>(context,
                                          listen: false)
                                      .checkboxes
                                      .indexOf(true),
                                );
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: Text('Add Image'),
            ),
          ],
        );
      }),
    );
  }

  void selectImage(BuildContext context, ImageSource source, int index) async {
    final picker = ImagePicker();
    final pickedImage = await picker.getImage(source: source);
    if (pickedImage != null) {
      Provider.of<HouseKeepingProviderUser>(context, listen: false)
          .setImage(File(pickedImage.path), index);
    }
  }
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