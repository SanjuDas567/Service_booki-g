import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:glossy_flossy/main.dart';

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  print("Title : ${message.notification!.title}");
  print("Body : ${message.notification!.body}");
  print("Payload : ${message.data}");
}

class FirebaseApi {
  // create an instance of Firebase Messaging
  final _firebaseMessaging = FirebaseMessaging.instance;
  //  function to initialize notifications
  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    final fCMToken = await _firebaseMessaging.getToken();
    print("Token : $fCMToken");
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
    initPushNotifications();
  }

// function to handle received messages
void handleMessages(RemoteMessage? message) {
    if(message == null) return;

// Navigate to new screen when message is received and user taps notification
navigatorKey.currentState?.popAndPushNamed(
  '/notification_screen',
  arguments: message
);
}
// function to initialize foreground and background settings
Future initPushNotifications() async {
// handle notification if the app was terminated and noe opened
    FirebaseMessaging.instance.getInitialMessage().then(handleMessages);
    
// when notification open the app
   FirebaseMessaging.onMessageOpenedApp.listen(handleMessages);
}
}