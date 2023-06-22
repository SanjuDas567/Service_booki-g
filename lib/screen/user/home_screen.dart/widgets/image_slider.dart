import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:glossy_flossy/provider/user/home_screen_provider.dart';
import 'package:provider/provider.dart';

class PictureSlideShow extends StatefulWidget {
  @override
  _PictureSlideShowState createState() => _PictureSlideShowState();
}

class _PictureSlideShowState extends State<PictureSlideShow> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenProvider>(
      builder: (context, homeScreenProvider, child) {
        return Center(
          child: CarouselSlider(
            items: homeScreenProvider.imagesForSlider.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.all(0.5),
                    clipBehavior: Clip.hardEdge,
                    // decoration:
                    //     BoxDecoration(color: Colors.lightBlue[100 * (i % 5)]),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Image.asset(
                        i,
                      ),
                    ),
                  );
                },
              );
            }).toList(),
            options: CarouselOptions(
              autoPlay: true,
              height: 200,
              enlargeCenterPage: true,
            ),
          ),
        );
      },
    );
  }
}
