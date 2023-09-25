import 'package:flutter/material.dart';
import 'package:glossy_flossy/provider/user/vehicle_booking_provider.dart';
import 'package:glossy_flossy/utils/color_resources.dart';
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
                    subtitle: Text('£ ${vehicleProvider
                          .vehicleServiceTypeModel!.data[0].servicePrice}',style: TextStyle(color: ColorResources.SNACKBAR_green),),
                    value: vehicleProvider.checkbox1,
                    onChanged: (value) {
                      vehicleProvider.updateCheckbox1(value!);
                       vehicleProvider.updateWashAndWax(vehicleProvider
                          .vehicleServiceTypeModel!.data[0].servicePrice);

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
                    subtitle: Text('£ ${vehicleProvider
                          .vehicleServiceTypeModel!.data[1].servicePrice}',style: TextStyle(color: ColorResources.SNACKBAR_green),),
                    value: vehicleProvider.checkbox2,
                    onChanged: (value) {
                      vehicleProvider.updateCheckbox2(value!);
                    vehicleProvider.updateFullVelet(vehicleProvider
                          .vehicleServiceTypeModel!.data[1].servicePrice);
                
                      print(vehicleProvider.fullVelet);
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
                    subtitle: Text('£ ${vehicleProvider
                          .vehicleServiceTypeModel!.data[2].servicePrice}',style: TextStyle(color: ColorResources.SNACKBAR_green),),
                   value: vehicleProvider.checkbox3,
                    onChanged: (value) {
                      vehicleProvider.updateCheckbox3(value!);
                      vehicleProvider.updateInteriorValet(vehicleProvider
                          .vehicleServiceTypeModel!.data[2].servicePrice);
                 
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
                    subtitle: Text('£ ${vehicleProvider
                          .vehicleServiceTypeModel!.data[3].servicePrice}',style: TextStyle(color: ColorResources.SNACKBAR_green),),
                    value: vehicleProvider.checkbox4,
                    onChanged: (value) {
                      vehicleProvider.updateCheckbox4(value!);
                      vehicleProvider.updateFullDetail(vehicleProvider
                          .vehicleServiceTypeModel!.data[3].servicePrice);
                    
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
                    subtitle: Text('£ ${vehicleProvider
                          .vehicleServiceTypeModel!.data[4].servicePrice}',style: TextStyle(color: ColorResources.SNACKBAR_green),),
                    value: vehicleProvider.checkbox5,
                    onChanged: (value) {
                      vehicleProvider.updateCheckbox5(value!);
                     vehicleProvider.updateEngineSteamWash(vehicleProvider
                          .vehicleServiceTypeModel!.data[4].servicePrice);
               
                    },
                  ),
                ],
              );
      },
    );
  }
}
