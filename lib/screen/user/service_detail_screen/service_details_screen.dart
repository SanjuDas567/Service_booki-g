import 'package:flutter/material.dart';
import 'package:glossy_flossy/screen/user/service_detail_screen/widgets/service_detail.items.dart';

class ServiceDetailsScreen extends StatelessWidget {
  const ServiceDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: Colors.black,
            title: Text('Service Details'),
          ),
          SliverToBoxAdapter(
            child: ServiceDetailsItem(),
          ),
        ],
      ),
    );
  }
}
