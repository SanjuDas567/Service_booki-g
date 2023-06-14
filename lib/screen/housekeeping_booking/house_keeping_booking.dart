import 'package:flutter/material.dart';
import 'package:glossy_flossy/utils/images.dart';

class HouseKeepingBookingScreen extends StatelessWidget {
  HouseKeepingBookingScreen({super.key});

  final _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              Images.WINDOW_CLEANIG,
              fit: BoxFit.cover,
            ),
            title: Text(
              'House Cleaning Booking',
              style: TextStyle(fontSize: 18, color: Colors.yellow),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return ListTile(
              title: Text('Item $index'),
            );
          }, childCount: 100),
        ),
      ],
    ));
  }
}
