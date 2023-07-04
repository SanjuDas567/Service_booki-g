import 'package:flutter/material.dart';
import 'package:glossy_flossy/provider/user/review_screen_provider.dart';
import 'package:glossy_flossy/screen/user/review_screen/widgets/review_field.dart';
import 'package:provider/provider.dart';
import 'package:reviews_slider/reviews_slider.dart';

class ReviewScreen extends StatelessWidget {
  ReviewScreen({super.key});

  final reviewController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Form(
        child: Consumer<ReviewProvider>(
          builder: (context, reviewProvider, child) {
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  title: Text('Review'),
                  backgroundColor: Colors.black,
                ),
                SliverToBoxAdapter(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'How was the service you received?',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                      SizedBox(height: 20),
                      ReviewSlider(
                        optionStyle: TextStyle(
                          color: Colors.yellow,
                          fontWeight: FontWeight.bold,
                        ),
                        onChange: (index) {
                          reviewProvider.onChange1(index);
                        },
                      ),
                      // Text(
                      //   reviewProvider.selectedValue.toString(),
                      //   style: TextStyle(color: Colors.yellow),
                      // ),
                    ],
                  ),
                ),
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      ReviewTextField(
                        controller: reviewController,
                      ),
                      SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      // border: Border.all(color: Colors.yellow),
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Center(
                      child: Text(
                        'Submit',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
