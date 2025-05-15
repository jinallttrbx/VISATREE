// import 'package:flutter/material.dart';
// import 'package:visatree/Widgets/const_text.dart';
//
// import 'package:visatree/util/appcontants.dart';
//
// class ChatSupport extends StatefulWidget {
//   const ChatSupport({super.key});
//
//   @override
//   State<ChatSupport> createState() => _ChatSupportState();
// }
//
// class _ChatSupportState extends State<ChatSupport> {
//   TextEditingController Messagetex=TextEditingController();
//   final List<Message> _messages = [];
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           titleSpacing: 0,
//
//           title: Row(
//             children: [
//               boldtext(Colors.white, 18, "Chat Support"),
//
//
//
//
//             ],
//           ),
//
//
//           shape: const RoundedRectangleBorder(
//               borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(10),
//                   bottomRight: Radius.circular(10))),
//           elevation: 0,
//           backgroundColor:  AppColors.primaryColor,
//         ),
//         body: Stack(fit: StackFit.expand, children: [
//           Column(
//             children: [
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: _messages.length,
//                   itemBuilder: (BuildContext context, int index) {
//                     final message = _messages[index];
//                     return ListTile(
//                       title: Text(message.text),
//
//                     );
//                   },
//                 ),
//               ),
//               _buildMessageComposer(),
//             ],
//           ),
//           Positioned(
//               left: 5,
//               right: 5,
//               bottom: 5,
//               child: Row(
//                 children: [
//                   Container(
//                     width: MediaQuery.of(context).size.width * 0.81,
//                     height: 41,
//                     decoration: ShapeDecoration(
//                       color: Colors.white,
//                       shape: RoundedRectangleBorder(
//                         side: BorderSide(width: 0.50, color: AppColors.primaryColor2),
//                         borderRadius: BorderRadius.circular(30),
//                       ),
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                       child: Row(
//                         children: [
//                           Icon(Icons.emoji_emotions_outlined),
//                           SizedBox(
//                             width: 5,
//                           ),
//                           Flexible(
//                             child: TextField(
//                               controller: Messagetex,
//                               decoration: InputDecoration(
//                                   hintText: "Type Here",
//                                   border: InputBorder.none),
//                             ),
//                           ),
//                           Transform.rotate(
//                               angle: -90,
//                               child: GestureDetector(
//                                 onTap: (){
//
//                                   print("open gallary");
//                                 },
//                                 child: Icon(Icons.attachment_outlined),
//                               ))
//                         ],
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     width: 10,
//                   ),
//                  GestureDetector(
//                    onTap: (){
//                      _sendMessage(Messagetex.text);
//                      print("send chat ");
//                    },
//                    child:  Container(
//                      width: 47,
//                      height: 41,
//                      decoration: ShapeDecoration(
//                        color: Colors.white,
//                        shape: RoundedRectangleBorder(
//                          side: BorderSide(width: 0.50, color: AppColors.primaryColor2),
//                          borderRadius: BorderRadius.circular(20),
//                        ),
//                      ),
//                      child: Icon(Icons.send),
//                    ),
//                  )
//                 ],
//               ))
//         ]),
//       ),
//     );
//   }
//
//   Widget _buildMessageComposer() {
//     return Container(
//       padding: EdgeInsets.all(8.0),
//       child: Row(
//         children: [
//           // Expanded(
//           //   child: TextField(
//           //     controller: Messagetex,
//           //     textInputAction: TextInputAction.send,
//           //     onSubmitted: (text) {
//           //       _sendMessage(text);
//           //     },
//           //     decoration: InputDecoration(
//           //       hintText: 'Enter your message...',
//           //     ),
//           //   ),
//           // ),
//           IconButton(
//             icon: Icon(Icons.send),
//             onPressed: () {
//               // Send message when the send button is pressed
//               _sendMessage(Messagetex.text);
//             },
//           ),
//         ],
//       ),
//     );
//   }
//
//   void _sendMessage(String text) {
//     // Assuming you have a function to send a message to your backend
//     // For example, with Firebase:
//     // FirebaseMessagingService.sendMessage(text);
//
//     // Add the sent message to the list
//     setState(() {
//       _messages.add(Message(
//         text: text,
//       ));
//       Messagetex.clear();
//     });
//   }
// }
// class Message {
//   final String text;
//
//
//   Message({required this.text, });
// }

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:visatreenew/model/chat_model.dart';
import 'package:visatreenew/util/ApiUrl.dart';
import 'package:visatreenew/util/session%20management.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsApp Chat UI',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChatScreen(),
    );
  }
}




class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, dynamic>> _messages = [];
  final ImagePicker _picker = ImagePicker();

  void _sendMessage({String? text, File? imageFile}) {
    if (text != null && text.isNotEmpty) {
      setState(() {
        _messages.add({
          "message": text,
          "isSentByMe": true,
          "time": DateTime.now().toLocal().toString().substring(11, 16),
          "type": "text",
        });
        _controller.clear();
      });
    } else if (imageFile != null) {
      setState(() {
        _messages.add({
          "image": imageFile,
          "isSentByMe": true,
          "time": DateTime.now().toLocal().toString().substring(11, 16),
          "type": "image",
        });
      });
    }
  }

  Widget _buildMessage(Map<String, dynamic> messageData) {
    bool isSentByMe = messageData['isSentByMe'];
    String time = messageData['time'];
    Widget messageContent;

    if (messageData['type'] == 'text') {
      messageContent = Text(
        messageData['message'],
        style: TextStyle(fontSize: 16),
      );
    } else if (messageData['type'] == 'image') {
      messageContent = Image.file(
        messageData['image'],
        width: 200,
        height: 200,
        fit: BoxFit.cover,
      );
    } else {
      messageContent = SizedBox();
    }

    return Align(
      alignment: isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
          color: isSentByMe ? Colors.blue[200] : Colors.grey[300],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment:
          isSentByMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            messageContent,
            SizedBox(height: 5),
            Text(
              time,
              style: TextStyle(fontSize: 12, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _sendMessage(imageFile: File(pickedFile.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[_messages.length - 1 - index];
                return _buildMessage(message);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.attach_file),
                  onPressed: _pickImage,
                ),
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: "Type a message",
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                FloatingActionButton(
                  onPressed: () => _sendMessage(text: _controller.text),
                  backgroundColor: Colors.teal,
                  child: Icon(Icons.send, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


