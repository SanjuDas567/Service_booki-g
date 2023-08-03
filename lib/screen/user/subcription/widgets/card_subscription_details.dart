import 'package:flutter/material.dart';
import 'package:glossy_flossy/utils/color_resources.dart';
import 'package:glossy_flossy/utils/images.dart';

class AuctionItem {
  final String name;
  final String username;
  final String description;
  final String imgUrl;

  final String time;
  final String price;

  AuctionItem(
      {required this.name,
      required this.username,
      required this.description,
      required this.imgUrl,
      required this.time,
      required this.price});
}

List<AuctionItem> auctionItems = [
  AuctionItem(
      name: "Silver Subscription",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      username: "@flutterbricks",
      imgUrl: Images.COMMERCIAL_BOOKING_SCREEN_IMAGE,
      time: "20h: 35m: 08s",
      price: "\$ 30.00"),
  AuctionItem(
      name: "Gold Subscription",
      description:
          "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
      username: "@henry",
      imgUrl: Images.COMMERCIAL_BOOKING_IMAGE_1,
      time: "20h: 35m: 08s",
      price: "\$ 50.00"),
  AuctionItem(
      name: "Platinum Subscription",
      description:
          "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
      username: "@henry",
      imgUrl: Images.COMMERCIAL_BOOKING_IMAGE_1,
      time: "20h: 35m: 08s",
      price: "\$ 100.00"),
];

// Give a sized box as its parent with width/height.
class CustomCarouselFB2 extends StatefulWidget {
  const CustomCarouselFB2({Key? key}) : super(key: key);

  @override
  _CustomCarouselFB2State createState() => _CustomCarouselFB2State();
}

class _CustomCarouselFB2State extends State<CustomCarouselFB2> {
  final double carouselItemMargin = 16;

  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0, viewportFraction: 1);
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: _pageController,
        itemCount: auctionItems.length,
        onPageChanged: (int position) {},
        itemBuilder: (BuildContext context, int position) {
          return imageSlider(position);
        });
  }

  Widget imageSlider(int position) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (BuildContext context, widget) {
        return Container(
          margin: EdgeInsets.all(carouselItemMargin),
          child: Center(child: widget),
        );
      },
      child: CardFb1(item: auctionItems[position]),
    );
  }
}

class CardFb1 extends StatelessWidget {
  final AuctionItem item;

  const CardFb1({required this.item, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1,
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(color: Colors.grey),
        boxShadow: [
          BoxShadow(
              offset: const Offset(10, 20),
              blurRadius: 10,
              spreadRadius: 0,
              color: Colors.grey.withOpacity(.05)),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                item.name,
                style: const TextStyle(
                    color: ColorResources.GLOSSY_FLOSSY_YELLOW,
                    fontWeight: FontWeight.bold),
              ),
              // Text(
              //   item.username,
              //   style: const TextStyle(color: Colors.grey),
              // )
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            item.description,
            style: TextStyle(
                color: ColorResources.GLOSSY_FLOSSY_WHITE, wordSpacing: 2),
          ),
          // Hero(
          //   tag: item.imgUrl,
          //   child: Image.asset(
          //     item.imgUrl,
          //     fit: BoxFit.cover,
          //     height: MediaQuery.of(context).size.height / 3.75,
          //   ),
          // ),
          const SizedBox(
            height: 25.0,
          ),
          // Text(
          //   item.price,
          //   style: TextStyle(
          //       color: ColorResources.GLOSSY_FLOSSY_YELLOW, wordSpacing: 2),
          // ),
          // const SizedBox(
          //   height: 25.0,
          // ),
          InkWell(
            onTap: () {},
            child: Container(
              height: 40,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.yellow),
                color: Colors.yellow,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: Text(
                  item.price,
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
