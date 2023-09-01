import 'package:flutter/material.dart';
import 'package:glossy_flossy/models/worker/form_data/edit_profile_model.dart';
import 'package:glossy_flossy/models/worker/profile_details_model.dart';
import 'package:glossy_flossy/provider/worker/auth_provider_worker.dart';
import 'package:glossy_flossy/provider/worker/profile_provider_worker.dart';
import 'package:glossy_flossy/screen/worker/profile_editscreen_worker/widgets/worker_email_field.dart';
import 'package:glossy_flossy/screen/worker/profile_editscreen_worker/widgets/worker_experience_field.dart';
import 'package:glossy_flossy/screen/worker/profile_editscreen_worker/widgets/worker_insurance_field.dart';
import 'package:glossy_flossy/screen/worker/profile_editscreen_worker/widgets/worker_location_field.dart';
import 'package:glossy_flossy/screen/worker/profile_editscreen_worker/widgets/worker_phone_field.dart';
import 'package:glossy_flossy/screen/worker/profile_editscreen_worker/widgets/worker_training_course_field.dart';
import 'package:glossy_flossy/screen/worker/profile_editscreen_worker/widgets/workerfname_field.dart';
import 'package:glossy_flossy/screen/worker/profile_editscreen_worker/widgets/workerlname_field.dart';
import 'package:glossy_flossy/utils/app_constants.dart';
import 'package:glossy_flossy/utils/color_resources.dart';
import 'package:glossy_flossy/utils/images.dart';
import 'package:glossy_flossy/widgets/custom_app_bar.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

class WorkerEditProfile extends StatefulWidget {
  WorkerCard workerCard;
  Screen screen;
   WorkerEditProfile({required this.workerCard, required this.screen});

  @override
  State<WorkerEditProfile> createState() => _WorkerEditProfileState();
}

class _WorkerEditProfileState extends State<WorkerEditProfile> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController  _fNameController;
  late TextEditingController _lNameController;
  late TextEditingController _phoneController;
  late TextEditingController _locationController;
  late TextEditingController _emailController;
  late TextEditingController _courseController;
  late TextEditingController _insuranceController;
  late TextEditingController _addressController;
  // late TextEditingController _workingFromController;
  // late TextEditingController _workingToController;
  late TextEditingController _experienceController;

  @override
  void initState() {
    // TODO: implement initState
   final profileProviderWorker = Provider.of<ProfileProviderWorker>(context,listen: false);
    super.initState();
    _fNameController = TextEditingController(text: widget.workerCard.empFirstname);
    _lNameController = TextEditingController(text: widget.workerCard.empLastname);
    _phoneController = TextEditingController(text: widget.screen.empPhone);
    _locationController = TextEditingController(text: widget.screen.empLocation);
    _addressController = TextEditingController(text: widget.screen.empAddress);
    _emailController = TextEditingController(text: widget.screen.empEmail);
    _courseController = TextEditingController(text: widget.screen.triningCourse);
    _insuranceController = TextEditingController(text: widget.workerCard.isuenceId);
    profileProviderWorker.avilTimeInputController = TextEditingController(text: widget.workerCard.workAvlFrom);
    profileProviderWorker.avilToTimeInputController = TextEditingController(text: widget.workerCard.workAvlTo);
    _experienceController = TextEditingController(text: widget.workerCard.experience);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.GLOSSY_FLOSSY_BLACK,
      body: CustomScrollView(
        slivers: [
          CustomAppBar(isBackButton: 1, isNotification: 1),
          SliverToBoxAdapter(
            child: Consumer<ProfileProviderWorker>(
            builder: (context, profileProviderWorker, child) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          CircleAvatar(
                            radius: 77,
                            backgroundColor:
                            ColorResources.GLOSSY_FLOSSY_YELLOW,
                            child: CircleAvatar(
                              radius: 75,
                              backgroundImage:
                              profileProviderWorker.editProfileImage != null
                                  ? FileImage(profileProviderWorker
                                  .editProfileImage!)
                              as ImageProvider<Object>?
                                  : NetworkImage(AppConstants.BASE_URL +  widget.screen.empProfilePic),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: InkWell(
                              onTap: () {
                                profileProviderWorker.pickEditImage();
                              },
                              child: Image.asset(
                                Images.CAMMERA_ICON,
                                height: 30,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      WorkerFirstNameField(
                        controller: _fNameController,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      WorkerLastNameField(
                        controller: _lNameController,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      WorkerPhoneField(
                        controller: _phoneController,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      WorkerLocationField(
                        controller: _locationController,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      WorkerEmailField(
                        controller: _emailController,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      WorkerTrainingCourseField(
                        controller: _courseController,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      WorkerInsuranceField(
                        controller: _insuranceController,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Consumer<ProfileProviderWorker>(
                        builder: (context, profileProviderWorker, _) {
                          return TextField(
                            controller: profileProviderWorker.avilTimeInputController,
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                labelText: "Working hours from",
                                hintStyle:
                                TextStyle(color: Colors.yellow.shade300),
                                labelStyle:
                                const TextStyle(color: ColorResources.GLOSSY_FLOSSY_YELLOW),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(18),
                                  borderSide:
                                  const BorderSide(color: Colors.yellow),
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(18),
                                    borderSide:
                                    const BorderSide(color: Colors.yellow))),
                            readOnly: true,
                            onTap: () => profileProviderWorker.selectTime(context),
                          );
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Consumer<ProfileProviderWorker>(
                        builder: (context, profileProviderWorker, _) {
                          return TextField(
                            controller:
                            profileProviderWorker.avilToTimeInputController,
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                labelText: "Working hours to",
                                hintStyle:
                                TextStyle(color: Colors.yellow.shade300),
                                labelStyle:
                                const TextStyle(color: ColorResources.GLOSSY_FLOSSY_YELLOW),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(18),
                                  borderSide:
                                  const BorderSide(color: Colors.yellow),
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(18),
                                    borderSide:
                                    const BorderSide(color: Colors.yellow))),
                            readOnly: true,
                            onTap: () => profileProviderWorker.selectToTime(context),
                          );
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      WorkerExperienceField(
                        controller: _experienceController,
                      ),
                      SizedBox(
                        height: 40,
                      ),
                  profileProviderWorker.isProfileUpdateLoading
                      ? CircularProgressIndicator(
                    color: ColorResources.GLOSSY_FLOSSY_YELLOW,
                  )
                  : InkWell(
                    onTap: () {
                      editWorkerProfile();
                    },
                    child: Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.yellow),
                        color: ColorResources.GLOSSY_FLOSSY_YELLOW,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Center(
                        child: Text(
                          'Update Profile',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                    ],
                  ),
                ),
              );
            },
            ),

            ),
        ],
      ),
    );
  }
  void editWorkerProfile() {
    final profileProviderWorker = Provider.of<ProfileProviderWorker>(context,listen: false);
    UpdateProfileData updateProfileData = UpdateProfileData();
    final authProviderWorker = Provider.of<AuthProviderWorker>(context,listen: false).getWorkerId();
    updateProfileData.empFirstname = _fNameController.text.trim();
    updateProfileData.empLastname = _lNameController.text.trim();
    updateProfileData.empPhone = _phoneController.text.trim();
    updateProfileData.empLocation = _locationController.text.trim();
    updateProfileData.empAddress = _addressController.text.trim();
    updateProfileData.empEmail = _emailController.text.trim();
    updateProfileData.workAvlFrom = profileProviderWorker.avilTimeInputController.text.trim();
    updateProfileData.workAvlTo = profileProviderWorker.avilToTimeInputController.text.trim();
    updateProfileData.insuranceId = _insuranceController.text.trim();
    updateProfileData.experience  =  _experienceController.text.trim();
    updateProfileData.triningCourse = _courseController.text.trim();
    updateProfileData.iD = authProviderWorker.toInt();
    if(_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final isDataChanged =
          _fNameController.text != widget.workerCard.empFirstname ||
      _lNameController.text != widget.workerCard.empLastname ||
      _phoneController.text != widget.screen.empPhone ||
      _locationController.text != widget.screen.empLocation ||
      _emailController.text != widget.screen.empEmail ||
      _courseController.text != widget.screen.triningCourse ||
      _insuranceController.text != widget.workerCard.isuenceId ||
      _addressController.text != widget.screen.empAddress ||
      _experienceController.text != widget.workerCard.experience ||
              profileProviderWorker.avilTimeInputController.text != widget.workerCard.workAvlFrom ||
      profileProviderWorker.avilToTimeInputController.text != widget.workerCard.workAvlTo;
      final isImageChanged = profileProviderWorker.editProfileImage != null;

      if(isDataChanged || isImageChanged) {
        print('inside data change');
        FocusManager.instance.primaryFocus?.unfocus();
        Provider.of<ProfileProviderWorker>(context, listen: false).updateWorkerData(
          updateProfileData, route
        );
      }else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Data not changed'),
          backgroundColor: Colors.red,
        ));
      }

    }
  }

  route(bool isRoute, String errorMessage) async {
    print('inside route worker profile');
    if (isRoute) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(errorMessage),
        backgroundColor: Colors.green,
      ));
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(errorMessage),
        backgroundColor: Colors.red,
      ));
    }
  }
}
