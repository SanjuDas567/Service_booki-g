import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paypal/flutter_paypal.dart';
import 'package:glossy_flossy/utils/app_constants.dart';
import 'package:glossy_flossy/utils/images.dart';
import 'package:nb_utils/nb_utils.dart'; //https://pub.dev/packages/nb_utils

class NotificationExpantionPanel extends StatefulWidget {
  final message;
   NotificationExpantionPanel({this.message}) ;

  @override
  _NotificationExpantionPanelState createState() =>
      _NotificationExpantionPanelState();
}

class _NotificationExpantionPanelState
    extends State<NotificationExpantionPanel> {
  // Future<void> createPlantFoodNotification() async {
  //   await AwesomeNotifications().createNotification(
  //     content: NotificationContent(
  //         id: 10,
  //         channelKey: 'my_channel',
  //         title: 'Simple Notification',
  //         body: 'Your service is accepted by worker'),
  //   );
  // }

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
                InkWell(
                  onTap: () {
                    // createPlantFoodNotification();
                  },
                  child: Container(
                    padding: EdgeInsets.all(4),
                    margin: EdgeInsets.all(4),
                    decoration: boxDecorationDefault(
                        border: Border.all(color: Colors.black26)),
                    child: Icon(
                      Icons.attach_money_outlined,
                      color: Colors.black54,
                    ),
                  ),
                ),
                10.width,
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black, // background
                      onPrimary: Colors.yellow, // foreground
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) => UsePaypal(
                              sandboxMode: true,
                              clientId: AppConstants.Client_ID,
                              secretKey: AppConstants.Secret_KEY,
                              returnURL: "https://example.com/return",
                              cancelURL: "https://example.com/cancel",
                              transactions: const [
                                {
                                  "amount": {
                                    "total": '50',
                                    "currency": "USD",
                                    "details": {
                                      "subtotal": '50',
                                      "shipping": '0',
                                      "shipping_discount": 0
                                    }
                                  },
                                  "description":
                                      "The payment transaction description.",
                                  // "payment_options": {
                                  //   "allowed_payment_method":
                                  //       "INSTANT_FUNDING_SOURCE"
                                  // },
                                  "item_list": {
                                    "items": [
                                      {
                                        "name": "A demo product",
                                        "quantity": 1,
                                        "price": '50',
                                        "currency": "USD"
                                      }
                                    ],

                                    // shipping address is not required though
                                    // "shipping_address": {
                                    //   "recipient_name": "Jane Foster",
                                    //   "line1": "Travis County",
                                    //   "line2": "",
                                    //   "city": "Austin",
                                    //   "country_code": "US",
                                    //   "postal_code": "73301",
                                    //   "phone": "+00000000",
                                    //   "state": "Texas"
                                    // },
                                  }
                                }
                              ],
                              note:
                                  "Contact us for any questions on your order.",
                              onSuccess: (Map params) async {
                                print("onSuccess: $params");
                              },
                              onError: (error) {
                                print("onError: $error");
                              },
                              onCancel: (params) {
                                print('cancelled: $params');
                              }),
                        ),
                      );
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
  }
}
