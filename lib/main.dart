import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:visatree/controller/chat_controller.dart';
import 'package:visatree/controller/firebase_class.dart';
import 'package:visatree/screens/appcontants.dart';
import 'package:visatree/screens/splash.dart';
import 'package:visatree/session%20management.dart';

// import 'controller/firebase_class.dart';`

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 // Permission.notification.request();
  await Firebase.initializeApp();
   //await FirebaseApi().initNotification();
  await Permission.notification.request().then((value) async {
    print("NOTIFICATION PERMISSION VALUER $value");
    if (value != PermissionStatus.granted) {
      await Permission.notification.request();
    }
  });
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //final controller = ChatController();
  @override
  void initState() {
   // setNotInChat();
   // controller.initMessaging();
    super.initState();
  }

  setNotInChat() async {
    SessionManagement share = SessionManagement();
    await share.setIsInChat(false);
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Visatree',
      theme: ThemeData(
        fontFamily: 'Poppins',
        appBarTheme: const AppBarTheme(
            centerTitle: true,
            color: AppColors.primaryColor,
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(30)))),
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}
