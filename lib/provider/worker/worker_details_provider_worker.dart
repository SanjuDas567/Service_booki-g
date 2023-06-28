import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class WorkerDetailsProvider extends ChangeNotifier {

   List<File> _selectedImages = [];

  List<File> get selectedImages => _selectedImages;

  Future<void> selectImages() async {
    final List<XFile>? selectedFiles = await ImagePicker().pickMultiImage();
    if (selectedFiles != null) {
      _selectedImages = selectedFiles.map((file) => File(file.path)).toList();
      notifyListeners();
    }
  }

  
  File? _image;

  File? get image => _image;

  File? _selectedImage1;
  File? get selectedImage1 => _selectedImage1;

  Future<void> getImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      _selectedImage1 = File(pickedImage.path);
      notifyListeners();
    }
  }

  void removeImage() {
    _selectedImage1 = null;
    notifyListeners();
  }
}

//image adding 