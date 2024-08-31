
import 'package:flutter/material.dart';
import 'package:gradient_progress_indicator/widget/gradient_progress_indicator_widget.dart';


import 'package:visatree/screens/appcontants.dart';
import 'package:visatree/util/images.dart';





class LoadingLayout extends StatelessWidget {
  const LoadingLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GradientProgressIndicator(
      radius: 50,
      duration: 3,
      strokeWidth: 3,
      gradientStops: const [
        0.8,
        0.2,
      ],
      gradientColors:  [
        AppColors.primaryColor,
        Colors.grey,
      ],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(images.logo,height: 50,)
        ],
      ),
    );

  }
}
