import 'dart:convert';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:visatree/ApiUrl.dart';

import '../model/chat_model.dart';
import '../screens/chatscreen.dart';
import '../session management.dart';
import 'package:http/http.dart' as http;

class ChatController extends GetxController {
  List<SingleChatData> _chatList = [];
  List<SingleChatData> get chatList => _chatList;

  getChat() async {
    SessionManagement share = SessionManagement();
    String token = await share.istoken();
    await share.setIsInChat(true);
    final response = await http.get(
        Uri.parse(ApiUrl.getchat),
        headers: {"Authorization": "Bearer $token"});

    final data = ChatModel.fromJson(jsonDecode(response.body));
    if (response.statusCode == 200) {
      _chatList.addAll(data.data ?? []);
    } else {
      print(response.body);
    }
    update();
  }

  addChat(String chat,) async {
    SessionManagement share = SessionManagement();
    String token = await share.istoken();
    String userId = await share.isuserid();
    var body = {"sender_id": userId.toString(), "message": chat,};
    final response = await http.post(
      Uri.parse(ApiUrl.addchat),
      headers: {"Authorization": "Bearer $token"},
      body: body,
    );
    if (response.statusCode == 200) {
      addStaticChat(chat, int.parse(userId), 'sender');
      update();
    } else {
      print(response.body);
    }
    update();
  }

  addStaticChat(String msg, int senderId, String type) {
    _chatList.add(
      SingleChatData(
        message: msg,
        senderId: senderId,
        type: type,
      ),
    );
    update();
  }

  void initMessaging() async {
    SessionManagement share = SessionManagement();

    void handleMessage(RemoteMessage? message) {
      if (message != null) {
        Get.to(const ChatScreen());
      }
    }

    var androiInit =
        const AndroidInitializationSettings("@mipmap/ic_launcher"); //for logo
    var iosInit = const DarwinInitializationSettings();
    var initSetting = InitializationSettings(android: androiInit, iOS: iosInit);
    final fltNotification = FlutterLocalNotificationsPlugin();
    fltNotification.initialize(initSetting);
    var androidDetails = const AndroidNotificationDetails("1", "channelName");
    var iosDetails = const DarwinNotificationDetails();

    var generalNotificationDetails =
        NotificationDetails(android: androidDetails, iOS: iosDetails);
    // FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
    //FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      final isinChat = await share.isinChat();
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      // AppleNotification? ios = message.notification?.apple;
      if (notification != null && android != null) {
        isinChat
            ? {
        //addStaticChat("chat", int.parse(1.toString()), 'sender'),
                addStaticChat("This message from admin", 1, "admin"),
              }
            : {
                fltNotification.show(notification.hashCode, notification.title,
                    notification.body, generalNotificationDetails)
              };
      }
    });
  }

  Future<void> handleBackgroundMessage(RemoteMessage message) async {
    Get.to(const ChatScreen());
  }
}
