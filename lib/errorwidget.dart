import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:visatree/const_text.dart';
import 'package:visatree/spacer.dart';
import 'package:visatree/util/images.dart';

class ErrorResponse extends StatelessWidget {
  const ErrorResponse({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios_new_outlined)),
        elevation: 0,
      ),
      body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text("Error"),
              vertical(20),
              mediumtext(Colors.grey, 18, "Error Occured Try Again Later")
            ],
          ),
        )
      ),
    );
  }
}
