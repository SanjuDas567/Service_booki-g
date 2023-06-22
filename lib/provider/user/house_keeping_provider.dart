import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

class HouseKeepingProviderUser extends ChangeNotifier {
  bool _isChecked = false;
  bool get isChecked => _isChecked;
  bool checkBox = false;
  bool isCheckBoxChecked1 = false;
  bool isCheckBoxChecked2 = false;
  bool isCheckBoxChecked3 = false;
  bool isCheckBoxChecked4 = false;
  bool isCheckBoxChecked5 = false;
  bool isCheckBoxChecked6 = false;
  bool isCheckBoxChecked = false;

  File? _image;

  File? get image => _image;

  Future<void> getImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      _selectedImage1 = File(pickedImage.path);
      notifyListeners();
    }
  }

  void removeImage() {
    _selectedImage1 = null;
    notifyListeners();
  }

  List<File?> images = List.generate(6, (index) => null);

  void setImage(File image, int index) {
    images[index] = image;
    notifyListeners();
  }

  // void removeImage(int index) {
  //   images[index] = null;
  //   notifyListeners();
  // }

  List<bool> checkboxes = List.generate(6, (index) => false);

  void toggleCheckbox(int index) {
    checkboxes[index] = !checkboxes[index];
    notifyListeners();
  }

  void selectImage(ImageSource source, int index) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: source);
    if (pickedImage != null) {
      images[index] = File(pickedImage.path);
      notifyListeners();
    }
    notifyListeners();
  }

  // void toggleCheckbox() {
  //   _isChecked = !_isChecked;
  //   notifyListeners();
  // }

  File? _selectedImage1;
  File? get selectedImage1 => _selectedImage1;

  File? _selectedImage2;
  File? get selectedImage2 => _selectedImage2;

  File? _selectedImage3;
  File? get selectedImage3 => _selectedImage3;

  File? _selectedImage4;
  File? get selectedImage4 => _selectedImage4;

  File? _selectedImage5;
  File? get selectedImage5 => _selectedImage5;

  File? _selectedImage6;
  File? get selectedImage6 => _selectedImage6;

  void setImage1(File image) {
    _selectedImage1 = image;
    notifyListeners();
  }

  void setImage2(File image) {
    _selectedImage2 = image;
    notifyListeners();
  }

  void setImage3(File image) {
    _selectedImage3 = image;
    notifyListeners();
  }

  void setImage4(File image) {
    _selectedImage4 = image;
    notifyListeners();
  }

  void setImage5(File image) {
    _selectedImage5 = image;
    notifyListeners();
  }

  void setImage6(File image) {
    _selectedImage6 = image;
    notifyListeners();
  }

  void setCheckBoxValue1() {
    isCheckBoxChecked1 = !isCheckBoxChecked1;
    notifyListeners();
  }

  void setCheckBoxValue2() {
    isCheckBoxChecked2 = !isCheckBoxChecked2;
    notifyListeners();
  }

  void setCheckBoxValue3() {
    isCheckBoxChecked2 = !isCheckBoxChecked3;
    notifyListeners();
  }

  void setCheckBoxValue4() {
    isCheckBoxChecked4 = !isCheckBoxChecked4;
    notifyListeners();
  }

  void setCheckBoxValue5() {
    isCheckBoxChecked5 = !isCheckBoxChecked5;
    notifyListeners();
  }

  void setCheckBoxValue6() {
    isCheckBoxChecked6 = !isCheckBoxChecked6;
    notifyListeners();
  }
}
