import 'dart:convert';
import 'dart:io';

import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:visatree/LoadingLayout.dart';
import 'package:visatree/controller/chat_controller.dart';
import 'package:visatree/model/chat_model.dart';
import 'package:visatree/screens/appcontants.dart';

import '../ApiUrl.dart';
import '../session management.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final controller = TextEditingController();
  final picker = ImagePicker();
  File? _image;
  bool isLoading =false;

  Future<void> getCountryList() async {
    SessionManagement share = SessionManagement();
    String token = await share.istoken();
    final response = await http.get(
      Uri.parse(ApiUrl.getcountry),
      headers: {"Authorization": "Bearer $token "},
    );
    if (response.statusCode == 200) {
      setState(() {});
    } else {
      throw Exception('Failed to load album');
    }
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
     getChat();
    } else {
      print(response.body);
    }
    //getChat();
  }
  addStaticChat(String msg, int senderId, String type) {
    chatList.add(
      SingleChatData(
        message: msg,
        senderId: senderId,
        type: type,
      ),
    );
   // getChat();
  }
  // addChat(String chat, bool isImage) async {
  //   SessionManagement share = SessionManagement();
  //   String token = await share.istoken();
  //   String userId = await share.isuserid();
  //   final header = {"Authorization": "Bearer $token"};
  //   final request = http.MultipartRequest(
  //       "POST", Uri.parse("${ApiUrl.baseurl}add_chat"));
  //   request.headers.addAll(header);
  //   request.fields['sender_id'] = userId.toString();
  //   isImage
  //       ? request.files.add(await http.MultipartFile.fromPath('message', chat))
  //       : request.fields['message'] = chat;
  //   final response = await request.send();
  //   if (response.statusCode == 200) {
  //     chatList.add(
  //       SingleChatData(
  //         message: chat,
  //         senderId: int.parse(userId),
  //         type: 'sender',
  //         messageType: isImage ? "image" : "message",
  //       ),
  //     );
  //     controller.clear();
  //     setState(() {
  //       getChat();
  //     });
  //   } else {}
  // }

  List<SingleChatData> chatList = [];

  getChat() async {
    setState(() {
      isLoading=true;
    });
    chatList = [];
    SessionManagement share = SessionManagement();
    String token = await share.istoken();
    await share.setIsInChat(true);

    final response = await http.get(
        Uri.parse("${ApiUrl.baseurl}get_chat"),
        headers: {"Authorization": "Bearer $token"});
    print(response.body);
    final data = ChatModel.fromJson(jsonDecode(response.body));
    if (response.statusCode == 200) {
      chatList.addAll(data.data ?? []);
      setState(() {
        isLoading=false;
      });
    } else {
      setState(() {
        isLoading=false;
      });
    }
  }

  Map<String, dynamic>? userMap;
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  String generateChatRoomId(String admin, String user) {
    if (admin[0].toLowerCase().codeUnits[0] > user.toLowerCase().codeUnits[0]) {
      return "$admin$user";
    } else {
      return "$user$admin";
    }
  }

  void onSendMessages() async {
    if (controller.text.isNotEmpty) {
      Map<String, dynamic> messages = {
        "sendBy": 'USER_NAME',
        "message": controller.text,
        "time": FieldValue.serverTimestamp(),
      };
      await _fireStore
          .collection('chatroom')
          .doc('chatRoomId')
          .collection('chats')
          .add(messages);
      controller.clear();
    } else {}
  }

  Future<void> chatNotification() async {
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  }

  Future<void> handleBackgroundMessage(RemoteMessage message) async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        chatList.add(
          SingleChatData(
              message: notification.title ?? 'This Notification from Admin',
              senderId: 1,
              type: 'admin'),
        );
        setState(() {});
      }
    });
  }

  @override
  void initState() {
    getChat();
   // Get.find<ChatController>().getChat();
    chatNotification();
    super.initState();
  }

  setChatScreen() async {
    SessionManagement share = SessionManagement();
    await share.setIsInChat(false);
  }

  @override
  void dispose() {
    //setChatScreen();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Chat With Us"),
        ),
        body: isLoading==true?LoadingLayout(): chatList.isEmpty?
        Container(child: Center(child: Text("No Chat Available"),),):
        ListView.builder(

          shrinkWrap: true,

          itemCount: chatList.length,
          itemBuilder: (context, index) =>
              BubbleSpecialThree(
                text: chatList[index].message ?? '',
                color: chatList[index].type == "sender"
                    ? AppColors.primaryColor
                    : AppColors.primaryColor2,
                tail: false,
                isSender: chatList[index].type == "sender",
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),

        ),
        // Column(
        //     children: [
        //       Expanded(child:  ),
        //
        //     ]
        // ),
      bottomNavigationBar:    Container(
        height: 50,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 20,),
            Expanded(
              child: TextFormField(
                controller: controller,
                cursorColor: AppColors.primaryColor,
                decoration: InputDecoration(
                  // suffixIcon: GestureDetector(
                  //   onTap: (){
                  //     _modalBottomSheetMenu(context);
                  //     print("select a gallary ");
                  //   },
                  //   child: Icon(Icons.attach_file,),),
                  hintText: "Type Here...",
                  prefixIcon: _image==null?Icon(Icons.ad_units,color: AppColors.primaryColor,):Image.file(_image!,height: 20,width: 20,),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide:
                    const BorderSide(color: AppColors.primaryColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide:
                    const BorderSide(color: AppColors.primaryColor),),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide:
                    const BorderSide(color: AppColors.primaryColor),
                  ),
                ),
              ),
            ),
            GetBuilder<ChatController>(builder: (chatController) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () async {
                    if (controller.text.isNotEmpty) {
                      // await chatController.addChat(controller.text);
                      addChat(controller.text);
                      controller.clear();
                    }
                  },
                  child: const Icon(
                    Icons.send,
                    size: 40,
                    color: AppColors.primaryColor,
                  ),
                ),
              );
            }),
          ],
        ),
      )
    );
  }


  void _modalBottomSheetMenu(
      context,
      ) {
    showModalBottomSheet(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width -
              20, // here increase or decrease in width
        ),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(5),
                topLeft: Radius.circular(5),
                bottomRight: Radius.circular(5),
                bottomLeft: Radius.circular(5))),
        context: context,
        builder: (BuildContext bc) {
          return Container(
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      AppColors.primaryColor,
                      AppColors.primaryColor2,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.4, 0.7],
                    tileMode: TileMode.repeated,
                  ),
                  borderRadius: BorderRadius.circular(5)),
              height: 100,
              // margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Center(
                child: Wrap(
                  children: <Widget>[
                    Row(
                      children: [
                        Expanded(
                            child: GestureDetector(
                              onTap: () {
                                openGallary();
                              },
                              child: const Icon(
                                Icons.image,
                                size: 50,
                                color: Colors.white,
                              ),
                            )),
                        Expanded(
                            child: GestureDetector(
                              onTap: () {
                                openCamera();
                              },
                              child: const Icon(
                                Icons.camera_alt,
                                size: 50,
                                color: Colors.white,
                              ),
                            ))
                      ],
                    )
                  ],
                ),
              ));
        });
  }

  Future openGallary() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
    Navigator.pop(context);
  }

  void openCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
    Navigator.pop(context);
  }
}
