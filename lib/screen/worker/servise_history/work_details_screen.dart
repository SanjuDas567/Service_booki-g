import 'package:flutter/material.dart';
import 'package:glossy_flossy/screen/worker/servise_history/widgets/service_details_item_worker.dart';

class WorkDetailsScreen extends StatelessWidget {
  const WorkDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.black,
            title: Text('Work details'),
          ),
          SliverToBoxAdapter(
            child: ServiceDetailItemWorker(),
          ),
        ],
      ),
    );
  }
}
