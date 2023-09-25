import 'package:flutter/material.dart';
import 'package:glossy_flossy/provider/user/house_keeping_provider.dart';
import 'package:glossy_flossy/utils/color_resources.dart';
import 'package:provider/provider.dart';

class CheckBoxCode extends StatelessWidget {
  const CheckBoxCode({super.key});

  @override
  Widget build(BuildContext context) {
    final houseKeepingProvider =
        Provider.of<HouseKeepingProvider>(context, listen: false);
    return Column(
      children: [
        // sofa vallet :----------------------------------------------------
        CheckboxListTile(
          checkColor: Colors.black,
          activeColor: Colors.yellow,
          fillColor:
              MaterialStateProperty.resolveWith((states) => Colors.yellow),
          title: Text(
            houseKeepingProvider.houseServiceTypeModel!.data[0].serviceName,
            style: TextStyle(color: Colors.white),
          ),
          value: houseKeepingProvider.checkbox1,
          subtitle: Text('£ ${houseKeepingProvider
                          .houseServiceTypeModel!.data[0].servicePrice}',style: TextStyle(color: ColorResources.SNACKBAR_green),
                          ),
          onChanged: (value) {
            houseKeepingProvider.updateCheckbox1(value!);
             houseKeepingProvider.updateSofaValetAmt(
              houseKeepingProvider
                          .houseServiceTypeModel!.data[0].servicePrice
             );
             houseKeepingProvider.checkbox2
                          ? null
                          : houseKeepingProvider.clearSofaValetImage();
          },
        ),
        houseKeepingProvider.checkbox1
            ? Column(
                children: [
                  GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5),
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: houseKeepingProvider.sofaValetImages.length,
                    itemBuilder: (context, index) {
                      final imageFile = houseKeepingProvider.sofaValetImages[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.file(
                          imageFile,
                          height: 50,
                        ),
                      );
                    },
                  ),
                  IconButton(
                      onPressed: () {
                        houseKeepingProvider.selectImages();
                      },
                      icon: Icon(
                        Icons.upload_outlined,
                        color: Colors.yellow,
                      )),
                ],
              )
            : SizedBox.shrink(),
        // sofa vallet :----------------------------------------------------

        // Carpet Clean :----------------------------------------------------
        CheckboxListTile(
          checkColor: Colors.black,
          activeColor: Colors.yellow,
          fillColor:
              MaterialStateProperty.resolveWith((states) => Colors.yellow),
          title: Text(
            houseKeepingProvider.houseServiceTypeModel!.data[1].serviceName,
            style: TextStyle(color: Colors.white),
          ),
          subtitle: Text('£ ${houseKeepingProvider
                          .houseServiceTypeModel!.data[1].servicePrice}',style: TextStyle(color: ColorResources.SNACKBAR_green),
                          ),
                    
          value: houseKeepingProvider.checkbox2,
          onChanged: (value) {
            houseKeepingProvider.updateCheckbox2(value!);
            houseKeepingProvider.updateCarpetCleanAmt(houseKeepingProvider
                          .houseServiceTypeModel!.data[1].servicePrice);
            print(houseKeepingProvider.sofaId);
            houseKeepingProvider.checkbox2
                          ? null
                          : houseKeepingProvider.clearcarpetImages();
          },
        ),
        houseKeepingProvider.checkbox2
            ? Column(
                children: [
                  GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5),
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: houseKeepingProvider.carpetCleanImages.length,
                    itemBuilder: (context, index) {
                      final imageFile =
                          houseKeepingProvider.carpetCleanImages[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.file(
                          imageFile,
                          height: 50,
                        ),
                      );
                    },
                  ),
                  IconButton(
                      onPressed: () {
                        houseKeepingProvider.selectcarpetImages();
                      },
                      icon: Icon(
                        Icons.upload_outlined,
                        color: Colors.yellow,
                      )),
                ],
              )
            : SizedBox.shrink(),
        // Carpet Clean :----------------------------------------------------

        // Stain Removal :----------------------------------------------------
        CheckboxListTile(
          checkColor: Colors.black,
          activeColor: Colors.yellow,
          fillColor:
              MaterialStateProperty.resolveWith((states) => Colors.yellow),
          title: Text(
            houseKeepingProvider.houseServiceTypeModel!.data[2].serviceName,
            style: TextStyle(color: Colors.white),
          ),
          value: houseKeepingProvider.checkbox3,
          subtitle: Text('£ ${houseKeepingProvider
                          .houseServiceTypeModel!.data[2].servicePrice}',style: TextStyle(color: ColorResources.SNACKBAR_green),
                          ),
          onChanged: (value) {
            houseKeepingProvider.updateCheckbox3(value!);
            houseKeepingProvider.updateStainRemovalAmt(houseKeepingProvider
                          .houseServiceTypeModel!.data[2].servicePrice);
                          houseKeepingProvider.checkbox2
                          ? null
                          : houseKeepingProvider.clearStainImages();
          },
        ),
        houseKeepingProvider.checkbox3
            ? Column(
                children: [
                  GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5),
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: houseKeepingProvider.stainRemovalImages.length,
                    itemBuilder: (context, index) {
                      final imageFile =
                          houseKeepingProvider.stainRemovalImages[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.file(
                          imageFile,
                          height: 50,
                        ),
                      );
                    },
                  ),
                  IconButton(
                      onPressed: () {
                        houseKeepingProvider.selectStainImages();
                      },
                      icon: Icon(
                        Icons.upload_outlined,
                        color: Colors.yellow,
                      )),
                ],
              )
            : SizedBox.shrink(),
        // Stain Removal :----------------------------------------------------

        // Window Cleaning :--------------------------------------------------
        CheckboxListTile(
          checkColor: Colors.black,
          activeColor: Colors.yellow,
          fillColor:
              MaterialStateProperty.resolveWith((states) => Colors.yellow),
          title: Text(
            houseKeepingProvider.houseServiceTypeModel!.data[3].serviceName,
            style: TextStyle(color: Colors.white),
          ),
          value: houseKeepingProvider.checkbox4,
          subtitle: Text('£ ${houseKeepingProvider
                          .houseServiceTypeModel!.data[3].servicePrice}',style: TextStyle(color: ColorResources.SNACKBAR_green),
                          ),
          onChanged: (value) {
            houseKeepingProvider.updateCheckbox4(value!);
            houseKeepingProvider.updateWindowCleaningAmt(houseKeepingProvider
                          .houseServiceTypeModel!.data[3].servicePrice);
                          houseKeepingProvider.checkbox2
                          ? null
                          : houseKeepingProvider.clearWindowImages();
          },
        ),
        houseKeepingProvider.checkbox4
            ? Column(
                children: [
                  GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5),
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: houseKeepingProvider.windowCleaningImages.length,
                    itemBuilder: (context, index) {
                      final imageFile =
                          houseKeepingProvider.windowCleaningImages[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.file(
                          imageFile,
                          height: 50,
                        ),
                      );
                    },
                  ),
                  IconButton(
                      onPressed: () {
                        houseKeepingProvider.selectWindowImages();
                      },
                      icon: Icon(
                        Icons.upload_outlined,
                        color: Colors.yellow,
                      )),
                ],
              )
            : SizedBox.shrink(),
        // Window Cleaning :------------------------------------------------

        // Gutering Cleaning :----------------------------------------------
        CheckboxListTile(
          checkColor: Colors.black,
          activeColor: Colors.yellow,
          fillColor:
              MaterialStateProperty.resolveWith((states) => Colors.yellow),
          title: Text(
            houseKeepingProvider.houseServiceTypeModel!.data[4].serviceName,
            style: TextStyle(color: Colors.white),
          ),
          value: houseKeepingProvider.checkbox5,
          subtitle: Text('£ ${houseKeepingProvider
                          .houseServiceTypeModel!.data[4].servicePrice}',style: TextStyle(color: ColorResources.SNACKBAR_green),
                          ),
          onChanged: (value) {
            houseKeepingProvider.updateCheckbox5(value!);
            houseKeepingProvider.updateGutteringCleaningAmt(houseKeepingProvider
                          .houseServiceTypeModel!.data[4].servicePrice);
                          houseKeepingProvider.checkbox2
                          ? null
                          : houseKeepingProvider.clearGuteringCleaningImages();
          },
        ),
        houseKeepingProvider.checkbox5
            ? Column(
                children: [
                  GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5),
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: houseKeepingProvider.guteringCleaningImages.length,
                    itemBuilder: (context, index) {
                      final imageFile =
                          houseKeepingProvider.guteringCleaningImages[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.file(
                          imageFile,
                          height: 50,
                        ),
                      );
                    },
                  ),
                  IconButton(
                      onPressed: () {
                        houseKeepingProvider.selectGuteringCleaningImages();
                      },
                      icon: Icon(
                        Icons.upload_outlined,
                        color: Colors.yellow,
                      )),
                ],
              )
            : SizedBox.shrink(),
        // Gutering Cleaning :----------------------------------------------

        // Driveway Pressure Wash :-----------------------------------------
        CheckboxListTile(
          checkColor: Colors.black,
          activeColor: Colors.yellow,
          fillColor:
              MaterialStateProperty.resolveWith((states) => Colors.yellow),
          title: Text(
            houseKeepingProvider.houseServiceTypeModel!.data[5].serviceName,
            style: TextStyle(color: Colors.white),
          ),
          subtitle: Text('£ ${houseKeepingProvider
                          .houseServiceTypeModel!.data[5].servicePrice}',style: TextStyle(color: ColorResources.SNACKBAR_green),
                          ),
          value: houseKeepingProvider.checkbox6,
          onChanged: (value) {
            houseKeepingProvider.updateCheckbox6(value!);
            houseKeepingProvider.updateDriveWayAmt(houseKeepingProvider
                          .houseServiceTypeModel!.data[5].servicePrice);
                          houseKeepingProvider.checkbox2
                          ? null
                          : houseKeepingProvider.clearDrivewayImages();
          },
        ),
        houseKeepingProvider.checkbox6
            ? Column(
                children: [
                  GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5),
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: houseKeepingProvider.drivewayImages.length,
                    itemBuilder: (context, index) {
                      final imageFile = houseKeepingProvider.drivewayImages[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.file(
                          imageFile,
                          height: 50,
                        ),
                      );
                    },
                  ),
                  IconButton(
                    onPressed: () {
                      houseKeepingProvider.selectDrivewayImages();
                    },
                    icon: Icon(
                      Icons.upload_outlined,
                      color: Colors.yellow,
                    ),
                  ),
                ],
              )
            : SizedBox.shrink(),
        // Driveway Pressure Wash :------------------------------------------
      ],
    );
  }
}
