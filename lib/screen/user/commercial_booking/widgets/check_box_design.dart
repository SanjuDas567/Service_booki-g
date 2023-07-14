import 'package:flutter/material.dart';
import 'package:glossy_flossy/provider/user/commercial_providder.dart';
import 'package:provider/provider.dart';

class CheckBoxCommercial extends StatelessWidget {
  const CheckBoxCommercial({super.key});

  @override
  Widget build(BuildContext context) {
    // final checkBoxProvider = Provider.of<CommercialBookingProvider>(context);
    return Consumer<CommercialBookingProvider>(
      builder: (context, checkBoxProvider, child) {
        return Column(
          children: [
            // sofa vallet :----------------------------------------------------
            CheckboxListTile(
              checkColor: Colors.black,
              activeColor: Colors.yellow,
              fillColor:
                  MaterialStateProperty.resolveWith((states) => Colors.yellow),
              title: const Text(
                'Sofa valet',
                style: TextStyle(color: Colors.white),
              ),
              value: checkBoxProvider.checkbox1,
              onChanged: (value) {
                checkBoxProvider.updateCheckbox1(value!);
                checkBoxProvider.checkbox1
                    ? null
                    : checkBoxProvider.clearSofaValetImage();
              },
            ),
            checkBoxProvider.checkbox1
                ? Column(
                    children: [
                      GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 5),
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: checkBoxProvider.sofaValetImages.length,
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
              fillColor:
                  MaterialStateProperty.resolveWith((states) => Colors.yellow),
              title: const Text(
                'Carpet Clean',
                style: TextStyle(color: Colors.white),
              ),
              value: checkBoxProvider.checkbox2,
              onChanged: (value) {
                checkBoxProvider.updateCheckbox2(value!);
                checkBoxProvider.checkbox2
                    ? null
                    : checkBoxProvider.clearcarpetImages();
              },
            ),
            checkBoxProvider.checkbox2
                ? Column(
                    children: [
                      GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 5),
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: checkBoxProvider.carpetCleanImages.length,
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
              fillColor:
                  MaterialStateProperty.resolveWith((states) => Colors.yellow),
              title: const Text(
                'Stain Removal',
                style: TextStyle(color: Colors.white),
              ),
              value: checkBoxProvider.checkbox3,
              onChanged: (value) {
                checkBoxProvider.updateCheckbox3(value!);
                checkBoxProvider.checkbox3
                    ? null
                    : checkBoxProvider.clearStainImages();
              },
            ),
            checkBoxProvider.checkbox3
                ? Column(
                    children: [
                      GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 5),
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: checkBoxProvider.stainRemovalImages.length,
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
              fillColor:
                  MaterialStateProperty.resolveWith((states) => Colors.yellow),
              title: const Text(
                'Window Cleaning',
                style: TextStyle(color: Colors.white),
              ),
              value: checkBoxProvider.checkbox4,
              onChanged: (value) {
                checkBoxProvider.updateCheckbox4(value!);
                checkBoxProvider.checkbox4
                    ? null
                    : checkBoxProvider.clearWindowImages();
              },
            ),
            checkBoxProvider.checkbox4
                ? Column(
                    children: [
                      GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 5),
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: checkBoxProvider.windowCleaningImages.length,
                        itemBuilder: (context, index) {
                          final imageFile =
                              checkBoxProvider.windowCleaningImages[index];
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
              fillColor:
                  MaterialStateProperty.resolveWith((states) => Colors.yellow),
              title: const Text(
                'Gutering Cleaning',
                style: TextStyle(color: Colors.white),
              ),
              value: checkBoxProvider.checkbox5,
              onChanged: (value) {
                checkBoxProvider.updateCheckbox5(value!);
                checkBoxProvider.checkbox5
                    ? null
                    : checkBoxProvider.clearGuteringCleaningImages();
              },
            ),
            checkBoxProvider.checkbox5
                ? Column(
                    children: [
                      GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 5),
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount:
                            checkBoxProvider.guteringCleaningImages.length,
                        itemBuilder: (context, index) {
                          final imageFile =
                              checkBoxProvider.guteringCleaningImages[index];
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
                            checkBoxProvider.selectGuteringCleaningImages();
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
              title: const Text(
                'Driveway Pressure Wash',
                style: TextStyle(color: Colors.white),
              ),
              value: checkBoxProvider.checkbox6,
              onChanged: (value) {
                checkBoxProvider.updateCheckbox6(value!);
                checkBoxProvider.checkbox6
                    ? null
                    : checkBoxProvider.clearDrivewayImages();
              },
            ),
            checkBoxProvider.checkbox6
                ? Column(
                    children: [
                      GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                          )),
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
