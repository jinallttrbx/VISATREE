import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:visatree/screens/appcontants.dart';
import 'package:visatree/util/images.dart';
import 'dart:ui' as ui;


class TaskDashboardScreen extends StatelessWidget {
  const TaskDashboardScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F6FA),
     // appBar: AppBar(
      //   elevation: 0,
      //   title: Text(
      //     'Tasks ',
      //     style: TextStyle(
      //         color: Colors.black,
      //         fontWeight: FontWeight.bold,
      //         fontSize: 16),
      //   ),
      //
      // ),
      body: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(

                  child:  TaskDashboardCard(
                    // ontap: () {
                    //   if (kDebugMode) {
                    //     print("total task card");
                    //   }
                    //   NavUtil.navigateScreen(
                    //       context,
                    //       TaskListScreen(
                    //           taskId: statistics?[0].status));
                    // },
                    customPainter: TotalTasklCustomPainter(),
                    title: "hhh",
                    count: 0.toString(),
                    titleAsset: images.logo,
                    titileColor: Colors.black,
                  ),
                ),
                InkWell(

                  child:  TaskDashboardCard(
                    // ontap: () {
                    //   if (kDebugMode) {
                    //     print("total task card");
                    //   }
                    //   NavUtil.navigateScreen(
                    //       context,
                    //       TaskListScreen(
                    //           taskId: statistics?[0].status));
                    // },
                    customPainter: TotalTasklCustomPainter1(),
                    title: "hhh",
                    count: 0.toString(),
                    titleAsset: images.logo,
                    titileColor: Colors.black,
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(

                  child:  TaskDashboardCard(
                    // ontap: () {
                    //   if (kDebugMode) {
                    //     print("total task card");
                    //   }
                    //   NavUtil.navigateScreen(
                    //       context,
                    //       TaskListScreen(
                    //           taskId: statistics?[0].status));
                    // },
                    customPainter: TotalTasklCustomPainter(),
                    title: "hhh",
                    count: 0.toString(),
                    titleAsset: images.logo,
                    titileColor: Colors.black,
                  ),
                ),
                InkWell(

                  child:  TaskDashboardCard(
                    // ontap: () {
                    //   if (kDebugMode) {
                    //     print("total task card");
                    //   }
                    //   NavUtil.navigateScreen(
                    //       context,
                    //       TaskListScreen(
                    //           taskId: statistics?[0].status));
                    // },
                    customPainter: TotalTasklCustomPainter1(),
                    title: "hhh",
                    count: 0.toString(),
                    titleAsset: images.logo,
                    titileColor: Colors.black,
                  ),
                )
              ],
            )
          ],
        ),
      )
    );
  }


}


class TaskDashboardCard extends StatelessWidget {
  const TaskDashboardCard(
      {Key? key, this.title, this.count, required this.customPainter, this.titileColor, this.titleAsset, this.ontap})
      : super(key: key);
  final String? title, count, titleAsset;
  final CustomPainter? customPainter;
  final Color? titileColor;
  final Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: ontap,
        child: SizedBox(
          width: MediaQuery.of(context).size.width / 2.25,
          height: 185,
          child: Stack(
            children: [
              Positioned(
                  top: 14,
                  left: 5,
                  right: 0,
                  child: DashBoardCard(
                    image: titleAsset!,
                    title: title ?? "",
                    textColor: titileColor ?? AppColors.primaryColor,
                  )),
              CustomPaint(
                size: Size(
                    140,
                    (140 * 0.5555555555555556)
                        .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                painter: customPainter,
                // painter: TotalTasklCustomPainter(),
              ),
              Positioned(
                  top: 13,
                  right: 0,
                  left: 53,
                  child: Text(
                    count ?? "0",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}


class DashBoardCard extends StatelessWidget {
  const DashBoardCard({Key? key, this.title, this.image, this.textColor})
      : super(key: key);

  final String? title, image;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      child: Container(
        height: 130,
        width: MediaQuery.of(context).size.width / 2.4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),
            Image.asset(
              image ?? "",
              //"assets/task/task.png",
              height: 24,
              width: 24,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              title ?? "",
              //"Total Task",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: textColor ?? Colors.black,
                  fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}





class TotalTasklCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.05797101, size.height * 0.3298728);
    path_0.cubicTo(
        size.width * 0.05797101,
        size.height * 0.1657924,
        size.width * 0.1597254,
        size.height * 0.03277848,
        size.width * 0.2852457,
        size.height * 0.03277848);
    path_0.lineTo(size.width * 0.7147543, size.height * 0.03277848);
    path_0.cubicTo(
        size.width * 0.8402754,
        size.height * 0.03277848,
        size.width * 0.9420290,
        size.height * 0.1657924,
        size.width * 0.9420290,
        size.height * 0.3298728);
    path_0.cubicTo(
        size.width * 0.9420290,
        size.height * 0.4939533,
        size.width * 0.8402754,
        size.height * 0.6269674,
        size.width * 0.7147543,
        size.height * 0.6269674);
    path_0.lineTo(size.width * 0.05797101, size.height * 0.6269674);
    path_0.lineTo(size.width * 0.05797101, size.height * 0.3298728);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.shader = ui.Gradient.linear(
        Offset(size.width * 0.05797101, size.height * 0.4403870),
        Offset(size.width * 0.9420290, size.height * 0.4403870),
        [const Color(0xff830010).withOpacity(1), const Color(0xffFF0037).withOpacity(1)],
        [0, 1]);
    canvas.drawPath(path_0, paint0Fill);

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.05808725, size.height * 0.8479957);
    path_1.lineTo(size.width * 0.05808725, size.height * 0.6267043);
    path_1.lineTo(size.width * 0.2588812, size.height * 0.6267043);
    path_1.cubicTo(
        size.width * 0.1392696,
        size.height * 0.6338109,
        size.width * 0.07518043,
        size.height * 0.7771935,
        size.width * 0.05808725,
        size.height * 0.8479957);
    path_1.close();

    Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.shader = ui.Gradient.linear(
        Offset(size.width * 0.05797101, size.height * 0.4403870),
        Offset(size.width * 0.9420290, size.height * 0.4403870),
        [const Color(0xff830010).withOpacity(1), const Color(0xffFF0037).withOpacity(1)],
        [0, 1]);
    canvas.drawPath(path_1, paint1Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class TotalTasklCustomPainter1 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.05797101, size.height * 0.3298728);
    path_0.cubicTo(
        size.width * 0.05797101,
        size.height * 0.1657924,
        size.width * 0.1597254,
        size.height * 0.03277848,
        size.width * 0.2852457,
        size.height * 0.03277848);
    path_0.lineTo(size.width * 0.7147543, size.height * 0.03277848);
    path_0.cubicTo(
        size.width * 0.8402754,
        size.height * 0.03277848,
        size.width * 0.9420290,
        size.height * 0.1657924,
        size.width * 0.9420290,
        size.height * 0.3298728);
    path_0.cubicTo(
        size.width * 0.9420290,
        size.height * 0.4939533,
        size.width * 0.8402754,
        size.height * 0.6269674,
        size.width * 0.7147543,
        size.height * 0.6269674);
    path_0.lineTo(size.width * 0.05797101, size.height * 0.6269674);
    path_0.lineTo(size.width * 0.05797101, size.height * 0.3298728);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.shader = ui.Gradient.linear(
        Offset(size.width * 0.05797101, size.height * 0.4403870),
        Offset(size.width * 0.9420290, size.height * 0.4403870),
        [const Color(0xff1c3758).withOpacity(1), const Color(0xff1c3758).withOpacity(1)],
        [0, 1]);
    canvas.drawPath(path_0, paint0Fill);

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.05808725, size.height * 0.8479957);
    path_1.lineTo(size.width * 0.05808725, size.height * 0.6267043);
    path_1.lineTo(size.width * 0.2588812, size.height * 0.6267043);
    path_1.cubicTo(
        size.width * 0.1392696,
        size.height * 0.6338109,
        size.width * 0.07518043,
        size.height * 0.7771935,
        size.width * 0.05808725,
        size.height * 0.8479957);
    path_1.close();

    Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.shader = ui.Gradient.linear(
        Offset(size.width * 0.05797101, size.height * 0.4403870),
        Offset(size.width * 0.9420290, size.height * 0.4403870),
        [const Color(0xff1c3758).withOpacity(1), const Color(0xff1c3758).withOpacity(1)],
        [0, 1]);
    canvas.drawPath(path_1, paint1Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}


void main() {runApp(MyApp());}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(appBar: AppBar(
          title: Text("Flutter GridView Demo"),
        ),
            body: GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 8.0,
                children: List.generate(choices.length, (index) {
                  return Center(
                    child: SelectCard(choice: choices[index]),
                  );
                }
                )
            )
        )
    );
  }
}

class Choice {
  const Choice({required this.title, required this.icon});
  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Home', icon: Icons.home),
  const Choice(title: 'Contact', icon: Icons.contacts),
  const Choice(title: 'Map', icon: Icons.map),
  const Choice(title: 'Phone', icon: Icons.phone),
  const Choice(title: 'Camera', icon: Icons.camera_alt),
  const Choice(title: 'Setting', icon: Icons.settings),
  const Choice(title: 'Album', icon: Icons.photo_album),
  const Choice(title: 'WiFi', icon: Icons.wifi),
];

class SelectCard extends StatelessWidget {
  const SelectCard({Key? key, required this.choice}) : super(key: key);
  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.bodySmall!;
    return Card(
        color: Colors.orange,
        child: Center(child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(child: Icon(choice.icon, size:50.0, color: textStyle.color)),
              Text(choice.title, style: textStyle),
            ]
        ),
        )
    );
  }
}