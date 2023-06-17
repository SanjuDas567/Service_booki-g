import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:glossy_flossy/provider/user/house_keeping_provider.dart';
import 'package:glossy_flossy/screen/user/housekeeping_booking/widgets/service_selection.dart';
import 'package:glossy_flossy/utils/images.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class HouseKeepingBookingScreen extends StatelessWidget {
  HouseKeepingBookingScreen({super.key});

  bool isChecked = false;
  bool isCheckBoxChecked = false;

  void toggleCheckbox() {
    isChecked = !isChecked;
  }

  final _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Consumer<HouseKeepingProviderUser>(
        builder: (context, houseKeepingProviderUser, child) => CustomScrollView(
          controller: _controller,
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.black,
              expandedHeight: 200,
              floating: true,
              pinned: true,
              snap: false,
              // title: Text(
              //   'Vehicle Wash Booking',
              //   style: TextStyle(color: Colors.yellow),
              // ),
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  Images.CARPET_CLEANING,
                  fit: BoxFit.cover,
                ),
                title: const Text(
                  'House Cleaning Booking',
                  style: TextStyle(
                    fontSize: 18,
                    // color: Colors.yellow,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: CalendarTimeline(
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime(2050, 11, 20),
                onDateSelected: (date) => print(date),
                leftMargin: 20,
                monthColor: Colors.blueGrey,
                dayColor: Colors.teal[200],
                activeDayColor: Colors.black,
                activeBackgroundDayColor: Colors.yellow,
                dotsColor: const Color(0xFF333A47),
                selectableDayPredicate: (date) => date.day != 23,
                locale: 'en_ISO',
              ),
            ),
            const SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text('Choose service you need',
                      style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: CheckboxImageUploadWidget(),
            ),
            // SliverToBoxAdapter(
            //   child: Column(
            //     children: [
            //       CheckboxWithTitle(
            //         isChecked: houseKeepingProviderUser.isCheckBoxChecked1,
            //         title: 'Sofa valet',
            //         onChanged: (value) {
            //           houseKeepingProviderUser.setCheckBoxValue1();
            //         },
            //       ),
            //       houseKeepingProviderUser.isCheckBoxChecked1
            //           ? CustomForm(
            //               isChecked: isChecked,
            //               onToggle: houseKeepingProviderUser.setCheckBoxValue1,
            //               image: houseKeepingProviderUser.selectedImage1,
            //               pickImage: () {
            //                 houseKeepingProviderUser.setImage1(image)
            //               },
            //               title: 'Sofa valet',
            //             )
            //           : SizedBox.shrink(),
            //     ],
            //   ),
            // ),
            // SliverToBoxAdapter(
            //   child: Column(
            //     children: [
            //       CheckboxWithTitle(
            //         isChecked: houseKeepingProviderUser.isCheckBoxChecked3,
            //         title: 'Carpet Clean',
            //         onChanged: (value) {
            //           houseKeepingProviderUser.setCheckBoxValue3();
            //         },
            //       ),
            //       houseKeepingProviderUser.isCheckBoxChecked3
            //           ? CustomForm(
            //               isChecked: isChecked,
            //               onToggle: houseKeepingProviderUser.setCheckBoxValue3,
            //               title: 'Carpet Clean',
            //             )
            //           : SizedBox.shrink(),
            //     ],
            //   ),
            // ),
            // SliverToBoxAdapter(
            //   child: Column(
            //     children: [
            //       CheckboxWithTitle(
            //         isChecked: houseKeepingProviderUser.isCheckBoxChecked4,
            //         title: 'Stain Removal',
            //         onChanged: (value) {
            //           houseKeepingProviderUser.setCheckBoxValue4();
            //         },
            //       ),
            //       houseKeepingProviderUser.isCheckBoxChecked4
            //           ? CustomForm(
            //               isChecked: isChecked,
            //               onToggle: houseKeepingProviderUser.setCheckBoxValue4,
            //               title: 'Stain Removal',
            //             )
            //           : SizedBox.shrink(),
            //     ],
            //   ),
            // ),
            // SliverToBoxAdapter(
            //   child: Column(
            //     children: [
            //       CheckboxWithTitle(
            //         isChecked: houseKeepingProviderUser.isCheckBoxChecked5,
            //         title: 'Window Cleaning',
            //         onChanged: (value) {
            //           houseKeepingProviderUser.setCheckBoxValue5();
            //         },
            //       ),
            //       houseKeepingProviderUser.isCheckBoxChecked5
            //           ? CustomForm(
            //               isChecked: isChecked,
            //               onToggle: houseKeepingProviderUser.setCheckBoxValue5,
            //               title: 'Window Cleaning',
            //             )
            //           : SizedBox.shrink(),
            //     ],
            //   ),
            // ),
            // SliverToBoxAdapter(
            //   child: Column(
            //     children: [
            //       CheckboxWithTitle(
            //         isChecked: houseKeepingProviderUser.isCheckBoxChecked6,
            //         title: 'Gutering Cleaning',
            //         onChanged: (value) {
            //           houseKeepingProviderUser.setCheckBoxValue6();
            //         },
            //       ),
            //       houseKeepingProviderUser.isCheckBoxChecked6
            //           ? CustomForm(
            //               isChecked: isChecked,
            //               onToggle: houseKeepingProviderUser.setCheckBoxValue6,
            //               title: 'Gutering Cleaning',
            //             )
            //           : SizedBox.shrink(),
            //     ],
            //   ),
            // ),
            // SliverToBoxAdapter(
            //   child: Column(
            //     children: [
            //       CheckboxWithTitle(
            //         isChecked: houseKeepingProviderUser.isCheckBoxChecked2,
            //         title: 'Driveway Pressure Wash',
            //         onChanged: (value) {
            //           houseKeepingProviderUser.setCheckBoxValue2();
            //         },
            //       ),
            //       houseKeepingProviderUser.isCheckBoxChecked2
            //           ? CustomForm(
            //               isChecked: isChecked,
            //               onToggle: houseKeepingProviderUser.setCheckBoxValue2,
            //               title: 'Driveway Pressure Wash',
            //             )
            //           : SizedBox.shrink(),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
