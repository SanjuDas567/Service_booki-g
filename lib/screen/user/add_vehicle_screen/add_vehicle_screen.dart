import 'package:flutter/material.dart';
import 'package:glossy_flossy/screen/user/add_vehicle_screen/widgets/vehicle_brand_dropdown.dart';
import 'package:glossy_flossy/screen/user/add_vehicle_screen/widgets/vehicle_model_dropdown.dart';
import 'package:glossy_flossy/screen/user/add_vehicle_screen/widgets/vehicle_num_textfield.dart';

class AddVehicleScreen extends StatelessWidget {
  AddVehicleScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  final _vehicleNumberController = TextEditingController();
  final _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(slivers: [
        SliverAppBar(
          title: Text('Add Vehicle'),
          backgroundColor: Colors.black,
        ),
        SliverToBoxAdapter(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.yellow,
                  child: CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 59,
                    child: Icon(
                      Icons.add_a_photo,
                      size: 30,
                      color: Colors.yellow,
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                VehicleBrandDropdown(),
                SizedBox(
                  height: 10,
                ),
                VehicleModelDropdown(),
                SizedBox(
                  height: 10,
                ),
                VehicleNumberField(
                  lastNameFocus: _focusNode,
                  controller: _vehicleNumberController,
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    // border: Border.all(color: Colors.yellow),
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Center(
                    child: Text(
                      'Submit',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
