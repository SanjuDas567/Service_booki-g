import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:glossy_flossy/screen/vehicle_wash_booking/service_selection_check_box.dart';
import 'package:glossy_flossy/utils/images.dart';

class VehicleWashBooking extends StatelessWidget {
  VehicleWashBooking({super.key});

  final _controller = ScrollController();
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: CustomScrollView(
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
                  Images.CAR_WASHING,
                  fit: BoxFit.cover,
                ),
                title: Text(
                  'Vehicle Wash Booking',
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
              dotsColor: Color(0xFF333A47),
              selectableDayPredicate: (date) => date.day != 23,
              locale: 'en_ISO',
            )),
            SliverToBoxAdapter(
              child: CheckBoxDemo(),
            ),
            // SliverList(
            //   delegate: SliverChildBuilderDelegate((context, index) {
            //     return ListTile(
            //       title: Text(
            //         'Item $index',
            //         style: TextStyle(
            //           color: Colors.white,
            //         ),
            //       ),
            //     );
            //   }, childCount: 10),
            // ),
          ],
        ));
  }
}
