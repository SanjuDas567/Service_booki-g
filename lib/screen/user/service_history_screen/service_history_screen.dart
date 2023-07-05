import 'package:flutter/material.dart';
import 'package:glossy_flossy/screen/user/service_history_screen/widgets/service_card_design.dart';

class ServiceHistoryScreen extends StatelessWidget {
  const ServiceHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.black,
            title: Text('Service History'),
          ),
          SliverList.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return ServiceCardDesign();
            },
          )
          // SliverToBoxAdapter(
          //   child: ,
          // )
        ],
      ),
    );
  }
}
