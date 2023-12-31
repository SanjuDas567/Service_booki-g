import 'package:flutter/material.dart';
import 'package:glossy_flossy/provider/user/commercial_providder.dart';
import 'package:glossy_flossy/utils/color_resources.dart';
import 'package:provider/provider.dart';

class CheckBoxCommercial extends StatelessWidget {
  const CheckBoxCommercial({super.key});

  @override
  Widget build(BuildContext context) {
    // final checkBoxProvider = Provider.of<CommercialBookingProvider>(context);
    return Consumer<CommercialBookingProvider>(
      builder: (context, checkBoxProvider, child) {
        return checkBoxProvider.isLoading
            ? Center(
                child: CircularProgressIndicator(
                  color: Colors.yellow,
                ),
              )
            : Column(
                children: [
                  // sofa vallet :----------------------------------------------------
                  CheckboxListTile(
                    checkColor: Colors.black,
                    activeColor: Colors.yellow,
                    fillColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.yellow),
                    title: Text(
                      checkBoxProvider
                          .commercialServiceTypeModel!.data[0].serviceName,
                      style: TextStyle(color: Colors.white),
                    ),
                    value: checkBoxProvider.checkbox1,
                     subtitle: Text('£ ${checkBoxProvider
                          .commercialServiceTypeModel!.data[0].servicePrice}',style: TextStyle(color: ColorResources.SNACKBAR_green),
                          ),
                    onChanged: (value) {
                      checkBoxProvider.updateCheckbox1(value!);
                      checkBoxProvider.updateSofaValetAmt(
              checkBoxProvider
                          .commercialServiceTypeModel!.data[0].servicePrice
             );
                      checkBoxProvider.checkbox1
                          ? null
                          : checkBoxProvider.clearSofaValetImage();
                    },
                  ),
                  checkBoxProvider.checkbox1
                      ? Column(
                          children: [
                            GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 5),
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount:
                                  checkBoxProvider.sofaValetImages.length,
                              itemBuilder: (context, index) {
                                final imageFile =
                                    checkBoxProvider.sofaValetImages[index];
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
                                  checkBoxProvider.selectImages();
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
                    fillColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.yellow),
                    title: Text(
                      checkBoxProvider
                          .commercialServiceTypeModel!.data[1].serviceName,
                      style: TextStyle(color: Colors.white),
                    ),
                     subtitle: Text('£ ${checkBoxProvider
                          .commercialServiceTypeModel!.data[1].servicePrice}',style: TextStyle(color: ColorResources.SNACKBAR_green),
                          ),
                    value: checkBoxProvider.checkbox2,
                    onChanged: (value) {
                      checkBoxProvider.updateCheckbox2(value!);
                      checkBoxProvider.updateCarpetCleanAmt(
              checkBoxProvider
                          .commercialServiceTypeModel!.data[1].servicePrice
             );
                      checkBoxProvider.checkbox2
                          ? null
                          : checkBoxProvider.clearcarpetImages();
                      print(checkBoxProvider.sofaId);
                    },
                  ),
                  checkBoxProvider.checkbox2
                      ? Column(
                          children: [
                            GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 5),
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount:
                                  checkBoxProvider.carpetCleanImages.length,
                              itemBuilder: (context, index) {
                                final imageFile =
                                    checkBoxProvider.carpetCleanImages[index];
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
                                  checkBoxProvider.selectcarpetImages();
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
                    fillColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.yellow),
                    title: Text(
                      checkBoxProvider
                          .commercialServiceTypeModel!.data[2].serviceName,
                      style: TextStyle(color: Colors.white),
                    ),
                     subtitle: Text('£ ${checkBoxProvider
                          .commercialServiceTypeModel!.data[2].servicePrice}',style: TextStyle(color: ColorResources.SNACKBAR_green),
                          ),
                    value: checkBoxProvider.checkbox3,
                    onChanged: (value) {
                      checkBoxProvider.updateCheckbox3(value!);
                      checkBoxProvider.updateStainRemovalAmt(
              checkBoxProvider
                          .commercialServiceTypeModel!.data[2].servicePrice
             );
                      checkBoxProvider.checkbox3
                          ? null
                          : checkBoxProvider.clearStainImages();
                    },
                  ),
                  checkBoxProvider.checkbox3
                      ? Column(
                          children: [
                            GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 5),
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount:
                                  checkBoxProvider.stainRemovalImages.length,
                              itemBuilder: (context, index) {
                                final imageFile =
                                    checkBoxProvider.stainRemovalImages[index];
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
                                  checkBoxProvider.selectStainImages();
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
                    fillColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.yellow),
                    title: Text(
                      checkBoxProvider
                          .commercialServiceTypeModel!.data[3].serviceName,
                      style: TextStyle(color: Colors.white),
                    ),
                     subtitle: Text('£ ${checkBoxProvider
                          .commercialServiceTypeModel!.data[3].servicePrice}',style: TextStyle(color: ColorResources.SNACKBAR_green),
                          ),
                    value: checkBoxProvider.checkbox4,
                    onChanged: (value) {
                      checkBoxProvider.updateCheckbox4(value!);
                      checkBoxProvider.updateWindowCleaningAmt(
              checkBoxProvider
                          .commercialServiceTypeModel!.data[3].servicePrice
             );
                      checkBoxProvider.checkbox4
                          ? null
                          : checkBoxProvider.clearWindowImages();
                    },
                  ),
                  checkBoxProvider.checkbox4
                      ? Column(
                          children: [
                            GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 5),
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount:
                                  checkBoxProvider.windowCleaningImages.length,
                              itemBuilder: (context, index) {
                                final imageFile = checkBoxProvider
                                    .windowCleaningImages[index];
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
                                  checkBoxProvider.selectWindowImages();
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
                    fillColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.yellow),
                    title: Text(
                      checkBoxProvider
                          .commercialServiceTypeModel!.data[4].serviceName,
                      style: TextStyle(color: Colors.white),
                    ),
                     subtitle: Text('£ ${checkBoxProvider
                          .commercialServiceTypeModel!.data[4].servicePrice}',style: TextStyle(color: ColorResources.SNACKBAR_green),
                          ),
                    value: checkBoxProvider.checkbox5,
                    onChanged: (value) {
                      checkBoxProvider.updateCheckbox5(value!);
                      checkBoxProvider.updateGutteringCleaningAmt(
              checkBoxProvider
                          .commercialServiceTypeModel!.data[4].servicePrice
             );
                      checkBoxProvider.checkbox5
                          ? null
                          : checkBoxProvider.clearGuteringCleaningImages();
                    },
                  ),
                  checkBoxProvider.checkbox5
                      ? Column(
                          children: [
                            GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 5),
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: checkBoxProvider
                                  .guteringCleaningImages.length,
                              itemBuilder: (context, index) {
                                final imageFile = checkBoxProvider
                                    .guteringCleaningImages[index];
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
                                  checkBoxProvider
                                      .selectGuteringCleaningImages();
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
                    fillColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.yellow),
                    title: Text(
                      checkBoxProvider
                          .commercialServiceTypeModel!.data[5].serviceName,
                      style: TextStyle(color: Colors.white),
                    ),
                     subtitle: Text('£ ${checkBoxProvider
                          .commercialServiceTypeModel!.data[5].servicePrice}',style: TextStyle(color: ColorResources.SNACKBAR_green),
                          ),
                    value: checkBoxProvider.checkbox6,
                    onChanged: (value) {
                      checkBoxProvider.updateCheckbox6(value!);
                      checkBoxProvider.updateDriveWayAmt(
              checkBoxProvider
                          .commercialServiceTypeModel!.data[5].servicePrice
             );
                      checkBoxProvider.checkbox6
                          ? null
                          : checkBoxProvider.clearDrivewayImages();
                    },
                  ),
                  checkBoxProvider.checkbox6
                      ? Column(
                          children: [
                            GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 5),
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: checkBoxProvider.drivewayImages.length,
                              itemBuilder: (context, index) {
                                final imageFile =
                                    checkBoxProvider.drivewayImages[index];
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
                                checkBoxProvider.selectDrivewayImages();
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
      },
    );
  }
}
