import 'package:flutter/material.dart';
import 'package:glossy_flossy/screen/worker/upcoming_work_screen/widgets/card_design_upcoming_work.dart';
import 'package:glossy_flossy/utils/color_resources.dart';

class UpcomingWork extends StatelessWidget {
  const UpcomingWork({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.GLOSSY_FLOSSY_BLACK,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: CardDesignWorker(),
          )
        ],
      ),
    );
  }
}