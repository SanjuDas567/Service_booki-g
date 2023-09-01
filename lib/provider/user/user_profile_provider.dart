import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:glossy_flossy/models/user/form_data/user_profile_update.dart';
import 'package:glossy_flossy/models/user/user_profile_model.dart';
import 'package:glossy_flossy/provider/user/repo/user_profile_repo.dart';
import 'package:glossy_flossy/utils/api_response.dart';
import 'package:image_picker/image_picker.dart';

class UserProfileProvider extends ChangeNotifier {
  final UserProfileRepo userProfileRepo;
  UserProfileProvider(this.userProfileRepo);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isEditLoading = false;
  bool get isEditLoading => _isEditLoading;

  UserProfileModel? userProfileModel;
  Message? message;
  Uint8List? imageBytes;
  Future<void> getProfileData(int uId) async {
    _isLoading = true;
    notifyListeners();
    ApiResponse apiResponse = await userProfileRepo.getUserProfileData(uId);
    _isLoading = false;
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      print('inside user profile 200');
      final userProfile = UserProfileModel.fromJson(apiResponse.response!.data);
      userProfileModel = userProfile;

      message = userProfile.message[0];
      print("image data ${imageBytes}");
    }
    notifyListeners();
  }

  //Image picker
  File? _profileImage;
  File? get profileImage => _profileImage;

  Future<void> pickImage() async {
    final imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      _profileImage = File(pickedImage.path);
      notifyListeners();
    }
  }

  File? _editProfileImage;
  File? get editProfileImage => _editProfileImage;

  Future<void> pickEditImage() async {
    final imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      _editProfileImage = File(pickedImage.path);
      notifyListeners();
    }
  }

  Future<void> updateUserData(
      UserUpdateModel userUpdateModel, Function callback) async {
    _isEditLoading = true;
    notifyListeners();
    ApiResponse apiResponse = await userProfileRepo.updateUserDetails(
        userUpdateModel, _editProfileImage!);
    _isEditLoading = false;
    if (apiResponse.response!.statusCode == 200) {
      print('inside update user 200');
      callback(true, 'Profile update successfully');
      notifyListeners();
    } else {
      print(apiResponse.error.toString());
    }
    notifyListeners();
  }
}
