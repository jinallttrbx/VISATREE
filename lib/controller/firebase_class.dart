import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:visatree/screens/chatscreen/chatscreen.dart';

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  print("handlebackgroundMessage");
  Get.to( ChatScreen());
}

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  void handleMessage(RemoteMessage? message) {
    if (message == null) return;

    // navigatorKey.currentState?.push(
    //   MaterialPageRoute(
    //     builder: (_) => const ChatScreen(),
    //   ),
    // );
    Get.to( ChatScreen());
  }

  final _androidChannel = const AndroidNotificationChannel(
    "high_important_channel",
    "High Important Channel",
    description:
        'This channel is used for important notifications.', // description
    importance: Importance.high,
  );

  final _localNotifications = FlutterLocalNotificationsPlugin();

  Future initLocalNotification() async {
    const android = AndroidInitializationSettings('@drawable/ic_launcher');
    const settings = InitializationSettings(android: android);

    await _localNotifications.initialize(settings,
        onDidReceiveNotificationResponse: (NotificationResponse payload) {
      print("rakesh");
      print(payload.payload);
      Get.to( ChatScreen());
      // if (payload.payload == null) return;
      // final message = RemoteMessage.fromMap(jsonDecode(payload.payload!));
      // handleMessage(message);
    }, onDidReceiveBackgroundNotificationResponse:
            (NotificationResponse payload) {
      print("satola");
      print(payload.payload);
      Get.to( ChatScreen());
      // if (payload.payload == null) return;
      // final message = RemoteMessage.fromMap(jsonDecode(payload.payload!));
      // handleMessage(message);
    });
    final platform = _localNotifications.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();
    await platform?.createNotificationChannel(_androidChannel);
  }

  Future initPushNotification() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    FirebaseMessaging.instance
        .getInitialMessage()
        .then((value) => handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);

    FirebaseMessaging.onMessage.listen((message) {
      final notification = message.notification;
      print(notification?.title ?? "");
      // if (notification == null) return;

      var androidDetails = const AndroidNotificationDetails("1", "channelName");
      var iosDetails = const DarwinNotificationDetails();
      AndroidNotification? android = message.notification?.android;
      var generalNotificationDetails =
          NotificationDetails(android: androidDetails, iOS: iosDetails);
      if (notification != null && android != null) {
        _localNotifications.show(notification.hashCode, notification.title,
            notification.body, generalNotificationDetails
            // NotificationDetails(
            //   android: AndroidNotificationDetails(
            //     _androidChannel.id,
            //     _androidChannel.name,
            //   ),
            // ),
            );
      }
    });
  }

  Future<void> initNotification() async {
    await _firebaseMessaging.requestPermission();
    await _firebaseMessaging.getToken();
    initPushNotification();
    initLocalNotification();
  }
}
