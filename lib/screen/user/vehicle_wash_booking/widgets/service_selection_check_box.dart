import 'package:flutter/material.dart';
import 'package:glossy_flossy/provider/user/vehicle_booking_provider.dart';
import 'package:provider/provider.dart';

class CheckBoxVehicle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
    Consumer<VehicleBookingProvider>(
      builder: (context, vehicleProvider, _) {
        return  Column(
                children: [
                  CheckboxListTile(
                    checkColor: Colors.black,
                    activeColor: Colors.yellow,
                    fillColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.yellow),
                    title: Text(
                      vehicleProvider
                          .vehicleServiceTypeModel!.data[0].serviceName ,
                      style: TextStyle(color: Colors.white),
                    ),
                    value: vehicleProvider.checkbox1,
                    onChanged: (value) {
                      vehicleProvider.updateCheckbox1(value!);
                    },
                  ),
                  CheckboxListTile(
                    checkColor: Colors.black,
                    activeColor: Colors.yellow,
                    fillColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.yellow),
                    title: Text(
                      vehicleProvider
                          .vehicleServiceTypeModel!.data[1].serviceName,
                      style: TextStyle(color: Colors.white),
                    ),
                    value: vehicleProvider.checkbox2,
                    onChanged: (value) {
                      vehicleProvider.updateCheckbox2(value!);
                    },
                  ),
                  CheckboxListTile(
                    checkColor: Colors.black,
                    activeColor: Colors.yellow,
                    fillColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.yellow),
                    title: Text(
                      vehicleProvider
                          .vehicleServiceTypeModel!.data[2].serviceName,
                      style: TextStyle(color: Colors.white),
                    ),
                   value: vehicleProvider.checkbox3,
                    onChanged: (value) {
                      vehicleProvider.updateCheckbox3(value!);
                    },
                  ),
                  CheckboxListTile(
                    checkColor: Colors.black,
                    activeColor: Colors.yellow,
                    fillColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.yellow),
                    title: Text(
                      vehicleProvider
                          .vehicleServiceTypeModel!.data[3].serviceName,
                      style: TextStyle(color: Colors.white),
                    ),
                    value: vehicleProvider.checkbox4,
                    onChanged: (value) {
                      vehicleProvider.updateCheckbox4(value!);
                    },
                  ),
                  CheckboxListTile(
                    checkColor: Colors.black,
                    activeColor: Colors.yellow,
                    fillColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.yellow),
                    title: Text(
                      vehicleProvider
                          .vehicleServiceTypeModel!.data[4].serviceName,
                      style: TextStyle(color: Colors.white),
                    ),
                    value: vehicleProvider.checkbox5,
                    onChanged: (value) {
                      vehicleProvider.updateCheckbox5(value!);
                    },
                  ),
                ],
              );
      },
    );
  }
}
