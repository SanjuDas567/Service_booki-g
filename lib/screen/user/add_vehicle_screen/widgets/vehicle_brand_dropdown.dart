import 'package:flutter/material.dart';
import 'package:glossy_flossy/provider/user/add_vehicle_provider.dart';
import 'package:provider/provider.dart';

class VehicleBrandDropdown extends StatelessWidget {
  VehicleBrandDropdown({super.key});

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(
        child: Text("maruthi"),
        value: "maruthi",
      ),
      const DropdownMenuItem(
        child: Text("honda"),
        value: "honda",
      ),
      const DropdownMenuItem(
        child: Text("tata"),
        value: "tata",
      ),
      const DropdownMenuItem(
        child: Text("suzuki"),
        value: "suzuki",
      ),
      const DropdownMenuItem(
        child: Text("hyundai"),
        value: "hyundai",
      ),
      const DropdownMenuItem(
        child: Text("bmw"),
        value: "bmw",
      ),
      const DropdownMenuItem(
        child: Text("ford"),
        value: "ford",
      ),
      const DropdownMenuItem(
        child: Text("nissan"),
        value: "nissan",
      ),
      const DropdownMenuItem(
        child: Text("chevrolet"),
        value: "chevrolet",
      ),
      const DropdownMenuItem(
        child: Text("volkswagen"),
        value: "volkswagen",
      ),
      const DropdownMenuItem(
        child: Text("renault"),
        value: "renault",
      ),
      const DropdownMenuItem(
        child: Text("fiat"),
        value: "fiat",
      ),
      const DropdownMenuItem(
        child: Text("jaguar"),
        value: "jaguar",
      ),
      const DropdownMenuItem(
        child: Text("citroen"),
        value: "citroen",
      ),
      const DropdownMenuItem(
        child: Text("audi"),
        value: "audi",
      ),
      const DropdownMenuItem(
        child: Text("skoda"),
        value: "skoda",
      ),
      const DropdownMenuItem(
        child: Text("seat"),
        value: "seat",
      ),
      const DropdownMenuItem(
        child: Text("mini"),
        value: "mini",
      ),
      const DropdownMenuItem(
        child: Text("dacia"),
        value: "dacia",
      ),
      const DropdownMenuItem(
        child: Text("opel"),
        value: "opel",
      ),
      const DropdownMenuItem(
        child: Text("lancia"),
        value: "lancia",
      ),
      const DropdownMenuItem(
        child: Text("smart"),
        value: "smart",
      ),
      const DropdownMenuItem(
        child: Text("bugatti"),
        value: "bugatti",
      ),
      const DropdownMenuItem(
        child: Text("lexus"),
        value: "lexus",
      ),
      const DropdownMenuItem(
        child: Text("koenigsegg"),
        value: "koenigsegg",
      ),
      const DropdownMenuItem(
        child: Text("maserati"),
        value: "maserati",
      ),
      const DropdownMenuItem(
        child: Text("gmc"),
        value: "gmc",
      ),
      const DropdownMenuItem(
        child: Text("dodge"),
        value: "dodge",
      ),
      const DropdownMenuItem(
        child: Text("chrysler"),
        value: "chrysler",
      ),
      const DropdownMenuItem(
        child: Text("jeep"),
        value: "jeep",
      ),
      const DropdownMenuItem(
        child: Text("subaru"),
        value: "subaru",
      ),
      const DropdownMenuItem(
        child: Text("toyota"),
        value: "toyota",
      ),
      const DropdownMenuItem(
        child: Text("acura"),
        value: "acura",
      ),
      const DropdownMenuItem(
        child: Text("mercedes-benz"),
        value: "mercedes-benz",
      ),
      const DropdownMenuItem(
        child: Text("porsche"),
        value: "porsche",
      ),
      const DropdownMenuItem(
        child: Text("mazda"),
        value: "mazda",
      ),
    ];
    return menuItems;
  }

  // List<String> items = [
  //   "maruthi",
  //   "honda",
  //   "tata",
  //   "suzuki",
  //   "hyundai",
  //   "bmw",
  //   "ford",
  //   "nissan",
  //   "chevrolet",
  //   "volkswagen",
  //   "renault",
  //   "fiat",
  //   "jaguar",
  //   "citroen",
  //   "audi",
  //   "skoda",
  //   "seat",
  //   "mini",
  //   "dacia",
  //   "opel",
  //   "lancia",
  //   "smart",
  //   "bugatti",
  //   "lexus",
  //   "koenigsegg",
  //   "maserati",
  //   "gmc",
  //   "dodge",
  //   "chrysler",
  //   "jeep",
  //   "subaru",
  //   "toyota",
  //   "acura",
  //   "mercedes-benz",
  //   "porsche",
  //   "mazda",
  // ];

  @override
  Widget build(BuildContext context) {
    return Consumer<AddNewVehicleProvider>(
      builder: (context, addNewVehicleProvider, child) {
        return DropdownButtonFormField(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.yellow, width: 2),
                borderRadius: BorderRadius.circular(20),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.yellow, width: 2),
                borderRadius: BorderRadius.circular(20),
              ),
              filled: true,
              fillColor: Colors.black,
              focusColor: Colors.yellow,
              hintText: 'Select your brand',
              hintStyle: TextStyle(color: Colors.yellow),
            ),
            validator: (value) => value == null ? "Select a country" : null,
            dropdownColor: Colors.yellow.shade400,
            value: addNewVehicleProvider.vehicleBrand,
            onChanged: (value) {
              print('Selected brand $value');
              addNewVehicleProvider.setVehicleValue(value);
            },
            items: dropdownItems);
      },
    );
  }
}
