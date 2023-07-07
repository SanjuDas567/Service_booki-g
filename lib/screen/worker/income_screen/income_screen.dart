import 'package:flutter/material.dart';
import 'package:glossy_flossy/screen/worker/income_screen/widgets/amount_card.dart';

class IncomeScreen extends StatelessWidget {
  const IncomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: RefreshIndicator(
        color: Colors.yellow,
        onRefresh: () async {},
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              floating: true,
              toolbarHeight: 30,
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              title: Text('Earnings'),
              titleTextStyle: TextStyle(fontSize: 15, color: Colors.black),
            ),
            SliverToBoxAdapter(
              child: AmountCardWorker(),
            ),
          ],
        ),
      ),
    );
  }
}
