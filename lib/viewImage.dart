import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewImage extends StatelessWidget {
  String url;
  ViewImage({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: SizedBox(
          width: Get.width,
          height: Get.height,
          child: Center(child: Image.network(url))),
    );
  }
}
