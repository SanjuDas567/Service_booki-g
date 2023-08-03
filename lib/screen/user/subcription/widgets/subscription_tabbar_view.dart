import 'package:flutter/material.dart';
import 'package:glossy_flossy/screen/user/subcription/widgets/commercial__subscription.dart';
import 'package:glossy_flossy/screen/user/subcription/widgets/house_subscrption_details.dart';
import 'package:glossy_flossy/screen/user/subcription/widgets/vhicle_subscription.dart';
import 'package:glossy_flossy/utils/color_resources.dart';

class TabPair {
  final Tab tab;
  final Widget view;
  TabPair({required this.tab, required this.view});
}

List<TabPair> TabPairs = [
  TabPair(
      tab: Tab(
        text: 'Vehicle',
      ),
      view: VehicleSubscription()),
  TabPair(
    tab: Tab(
      text: 'House',
    ),
    view: HouseSubscription(),
  ),
  TabPair(
    tab: Tab(
      text: 'Commercial',
    ),
    view: CommmercialSubscription(),
  )
];

class TabBarAndTabViews extends StatefulWidget {
  @override
  _TabBarAndTabViewsState createState() => _TabBarAndTabViewsState();
}

class _TabBarAndTabViewsState extends State<TabBarAndTabViews>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: TabPairs.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          // give the tab bar a height [can change height to preferred height]
          Container(
            height: 45,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                25.0,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(6),
              child: TabBar(
                  controller: _tabController,
                  // give the indicator a decoration (color and border radius)
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      25.0,
                    ),
                    color: ColorResources.GLOSSY_FLOSSY_YELLOW,
                  ),
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  tabs: TabPairs.map((tabPair) => tabPair.tab).toList()),
            ),
          ),
          Expanded(
            child: TabBarView(
                controller: _tabController,
                children: TabPairs.map((tabPair) => tabPair.view).toList()),
          ),
        ],
      ),
    );
  }
}
