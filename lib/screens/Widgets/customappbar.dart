import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
   CustomAppBar({super.key, required this.txt});
  String txt;
  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Text(txt),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ));
  }
}
