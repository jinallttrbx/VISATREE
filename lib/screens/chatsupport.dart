import 'package:flutter/material.dart';
import 'package:visatree/const_text.dart';
import 'package:visatree/screens/appcontants.dart';

class ChatSupport extends StatefulWidget {
  const ChatSupport({super.key});

  @override
  State<ChatSupport> createState() => _ChatSupportState();
}

class _ChatSupportState extends State<ChatSupport> {
  TextEditingController Messagetex=TextEditingController();
  final List<Message> _messages = [];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 0,

          title: Row(
            children: [
              boldtext(Colors.white, 18, "Chat Support"),




            ],
          ),


          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10))),
          elevation: 0,
          backgroundColor:  AppColors.primaryColor,
        ),
        body: Stack(fit: StackFit.expand, children: [
          Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: _messages.length,
                  itemBuilder: (BuildContext context, int index) {
                    final message = _messages[index];
                    return ListTile(
                      title: Text(message.text),

                    );
                  },
                ),
              ),
              _buildMessageComposer(),
            ],
          ),
          Positioned(
              left: 5,
              right: 5,
              bottom: 5,
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.81,
                    height: 41,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 0.50, color: Color(0xFF43749E)),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        children: [
                          Icon(Icons.emoji_emotions_outlined),
                          SizedBox(
                            width: 5,
                          ),
                          Flexible(
                            child: TextField(
                              controller: Messagetex,
                              decoration: InputDecoration(
                                  hintText: "Type Here",
                                  border: InputBorder.none),
                            ),
                          ),
                          Transform.rotate(
                              angle: -90,
                              child: GestureDetector(
                                onTap: (){

                                  print("open gallary");
                                },
                                child: Icon(Icons.attachment_outlined),
                              ))
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                 GestureDetector(
                   onTap: (){
                     _sendMessage(Messagetex.text);
                     print("send chat ");
                   },
                   child:  Container(
                     width: 47,
                     height: 41,
                     decoration: ShapeDecoration(
                       color: Colors.white,
                       shape: RoundedRectangleBorder(
                         side: BorderSide(width: 0.50, color: Color(0xFF43749E)),
                         borderRadius: BorderRadius.circular(20),
                       ),
                     ),
                     child: Icon(Icons.send),
                   ),
                 )
                ],
              ))
        ]),
      ),
    );
  }

  Widget _buildMessageComposer() {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: [
          // Expanded(
          //   child: TextField(
          //     controller: Messagetex,
          //     textInputAction: TextInputAction.send,
          //     onSubmitted: (text) {
          //       _sendMessage(text);
          //     },
          //     decoration: InputDecoration(
          //       hintText: 'Enter your message...',
          //     ),
          //   ),
          // ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              // Send message when the send button is pressed
              _sendMessage(Messagetex.text);
            },
          ),
        ],
      ),
    );
  }

  void _sendMessage(String text) {
    // Assuming you have a function to send a message to your backend
    // For example, with Firebase:
    // FirebaseMessagingService.sendMessage(text);

    // Add the sent message to the list
    setState(() {
      _messages.add(Message(
        text: text,
      ));
      Messagetex.clear();
    });
  }
}
class Message {
  final String text;


  Message({required this.text, });
}