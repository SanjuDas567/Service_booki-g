import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:glossy_flossy/screen/user/vehicle_wash_booking/widgets/service_selection_check_box.dart';
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
            SliverToBoxAdapter(
              child: SizedBox(
                height: 30,
              ),
            ),
            SliverToBoxAdapter(
              child: InkWell(
                onTap: () {
                  showDialog<void>(
                    context: context,
                    barrierDismissible: false, // user must tap button!
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor: Colors.yellow.shade400,
                        title: const Text('Continue booking'),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: const <Widget>[
                              Text('Are you sure want to book vehicle wash?'),
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('No'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            child: const Text('Yes'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                  // Navigator.push(
                  //   context, MaterialPageRoute(
                  //   builder: (context)=> ),);
                },
                child: Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.yellow),
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Center(
                    child: Text(
                      'Book wash',
                      style: TextStyle(color: Colors.yellow),
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
