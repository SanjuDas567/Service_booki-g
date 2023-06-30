import 'package:flutter/material.dart';
import 'package:glossy_flossy/utils/images.dart';
import 'package:nb_utils/nb_utils.dart'; //https://pub.dev/packages/nb_utils

class NotificationExpantionPanel extends StatefulWidget {
  const NotificationExpantionPanel({Key? key}) : super(key: key);

  @override
  _NotificationExpantionPanelState createState() =>
      _NotificationExpantionPanelState();
}

class _NotificationExpantionPanelState
    extends State<NotificationExpantionPanel> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: boxDecorationDefault(
          borderRadius: radius(32), color: context.cardColor),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          backgroundColor: context.cardColor,
          title: Text(
            'Item {index + 1}',
            style: primaryTextStyle(),
          ),
          leading: CircleAvatar(
            backgroundImage: AssetImage(Images.PROFILE_IMAGE),
            radius: 20,
          ),
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
          childrenPadding: EdgeInsets.only(left: 32, top: 16, bottom: 16),
          collapsedIconColor: context.iconColor,
          iconColor: context.iconColor,
          children: [
            Text.rich(
              TextSpan(
                text: 'Id :',
                style: primaryTextStyle(),
                children: <InlineSpan>[
                  TextSpan(text: ' 12786', style: secondaryTextStyle()),
                ],
              ),
            ),
            2.height,
            Text.rich(
              TextSpan(
                text: 'Name :',
                style: primaryTextStyle(),
                children: <InlineSpan>[
                  TextSpan(
                      text: ' Boby',
                      style: secondaryTextStyle(color: Colors.redAccent)),
                ],
              ),
            ),
            2.height,
            Text.rich(
              TextSpan(
                text: 'Phone Num  : ',
                style: primaryTextStyle(),
                children: <InlineSpan>[
                  TextSpan(text: ' 65874596665', style: secondaryTextStyle()),
                ],
              ),
            ),
            2.height,
            Text.rich(
              TextSpan(
                text: 'Working Location : ',
                style: primaryTextStyle(),
                children: <InlineSpan>[
                  TextSpan(text: ' Cambridge', style: secondaryTextStyle()),
                ],
              ),
            ),
            2.height,
            Text.rich(
              TextSpan(
                text: 'Work Shedule time : ',
                style: primaryTextStyle(),
                children: <InlineSpan>[
                  TextSpan(text: ' 02 : 30', style: secondaryTextStyle()),
                ],
              ),
            ),
            2.height,
            Divider(
              endIndent: 32,
              color: Colors.black54,
            ),
            Text.rich(
              TextSpan(
                text: 'Amount : ',
                style: primaryTextStyle(),
                children: <InlineSpan>[
                  TextSpan(
                      text: ' \$ 352 ',
                      style: secondaryTextStyle(
                        weight: FontWeight.bold,
                      )),
                ],
              ),
            ),
            // 2.height,
            // Text.rich(
            //   TextSpan(
            //     text: 'Active Until : ',
            //     style: primaryTextStyle(),
            //     children: <InlineSpan>[
            //       TextSpan(
            //           text: ' February 28,2019 at 7:05 PM ',
            //           style: secondaryTextStyle()),
            //     ],
            //   ),
            // ),
            4.height,
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(4),
                  margin: EdgeInsets.all(4),
                  decoration: boxDecorationDefault(
                      border: Border.all(color: Colors.black26)),
                  child: Icon(
                    Icons.attach_money_outlined,
                    color: Colors.black54,
                  ),
                ),
                10.width,
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black, // background
                      onPrimary: Colors.yellow, // foreground
                    ),
                    onPressed: () {
                      print('Pay button pressed');
                    },
                    child: Text(
                      'Pay',
                      style: TextStyle(color: Colors.yellow),
                    )),
                // Container(
                //   padding: EdgeInsets.all(4),
                //   margin: EdgeInsets.all(4),
                //   decoration: boxDecorationDefault(
                //       border: Border.all(color: Colors.black26)),
                //   child: Icon(
                //     Icons.apartment_outlined,
                //     color: Colors.black54,
                //   ),
                // )
              ],
            )
          ],
        ),
      ),
    );

    // ListView.builder(
    //   padding: EdgeInsets.only(bottom: 30, top: 26),
    //   physics: NeverScrollableScrollPhysics(),
    //   shrinkWrap: true,
    //   itemCount: 20,
    //   itemBuilder: (context, index) {
    //     return
    //   },
    // );
  }
}
