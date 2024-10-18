import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:get/get.dart';
import 'package:visatree/Widgets/const_text.dart';

import 'package:visatree/controller/documentcontroller.dart';
import 'package:visatree/util/appcontants.dart';

class ViewDocument extends StatefulWidget {
  ViewDocument({super.key});

  @override
  State<ViewDocument> createState() => _ViewDocumentState();
}

class _ViewDocumentState extends State<ViewDocument> {
  final double padding=0;
  @override
  void initState() {
    Get.find<DocumentController>().getuploadeddocument();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          title: Row(
            children: [
              boldtext(Colors.white, 18, "Show Upload Document"),
            ],
          ),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10))),
          elevation: 0,
          backgroundColor: AppColors.primaryColor,
        ),
        body: GetX<DocumentController>(
          builder: (controller) {
            return controller.isLoading.isTrue
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                :controller.DocumentList.isEmpty?Container(
              child: Center(child: Text("Document Not Uploaded"),),
            ):   Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: ListTile(

                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => PDFScreen(
                                url: controller.DocumentList[0].
                                pdfFileSopFullPath ??
                                    '',
                                name: "SOP",
                              ),
                            ),
                          );
                        },
                        leading: Icon(Icons.picture_as_pdf),
                        title: Padding(
                          padding:  EdgeInsets.all(padding),
                          child:Container(
                            height: 30,
                            child: Stack(
                              clipBehavior: Clip.none, alignment: Alignment.centerLeft,
                              children: <Widget>[
                                Positioned(
                                  child: const Text("SOP"),
                                  left: padding-25,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(

                      child: ListTile(

                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => PDFScreen(
                                url: controller.DocumentList[0].
                                pdfFileLorFullPath ??
                                    '',
                                name: "LOR",
                              ),
                            ),
                          );
                        },
                        leading: Icon(Icons.picture_as_pdf),
                        title: Padding(
                          padding:  EdgeInsets.all(padding),
                          child:Container(
                            height: 30,
                            child: Stack(
                              clipBehavior: Clip.none, alignment: Alignment.centerLeft,
                              children: <Widget>[
                                Positioned(
                                  child: const Text("LOR"),
                                  left: padding-25,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        onTap: () => Get.to(PDFScreen(
                          url: controller.DocumentList[0].pdfFileExamFullPath ??
                              '',
                          name: "EXAM",
                        )),
                        leading: Icon(Icons.picture_as_pdf),
                        title: Padding(
                          padding:  EdgeInsets.all(padding),
                          child:Container(
                            height: 30,
                            child: Stack(
                              clipBehavior: Clip.none, alignment: Alignment.centerLeft,
                              children: <Widget>[
                                Positioned(
                                  child: const Text("EXAM"),
                                  left: padding-25,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        onTap: () => Get.to(PDFScreen(
                          url: controller.DocumentList[0].pdfFileCertificationFullPath ??
                              '',
                          name: "CERTIFICATE",
                        )),
                        leading: Icon(Icons.picture_as_pdf),
                        title: Padding(
                          padding:  EdgeInsets.all(padding),
                          child:Container(
                            height: 30,
                            child: Stack(
                              clipBehavior: Clip.none, alignment: Alignment.centerLeft,
                              children: <Widget>[
                                Positioned(
                                  child: const Text("CERTIFICATE"),
                                  left: padding-25,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        onTap: () => Get.to(PDFScreen(
                          url: controller.DocumentList[0].pdfFileResumeFullPath ??
                              '',
                          name: "RESUME",
                        )),
                        leading: Icon(Icons.picture_as_pdf),
                        title: Padding(
                          padding:  EdgeInsets.all(padding),
                          child:Container(
                            height: 30,
                            child: Stack(
                              clipBehavior: Clip.none, alignment: Alignment.centerLeft,
                              children: <Widget>[
                                Positioned(
                                  child: const Text("RESUME"),
                                  left: padding-25,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        onTap: () => Get.to(PDFScreen(
                          url: controller.DocumentList[0].pdfFilePassportFullPath ??
                              '',
                          name: "PASSPORT",
                        )),
                        leading: Icon(Icons.picture_as_pdf),
                        title: Padding(
                          padding:  EdgeInsets.all(padding),
                          child:Container(
                            height: 30,
                            child: Stack(
                              clipBehavior: Clip.none, alignment: Alignment.centerLeft,
                              children: <Widget>[
                                Positioned(
                                  child: const Text("PASSPORT"),
                                  left: padding-25,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            );

          },
        ));
  }
}

class PDFScreen extends StatelessWidget {
  final String url;
  final String name;
  const PDFScreen({
    Key? key,
    required this.url,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(url);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.close),
        ),
        elevation: 0,
        title: Text(name),
      ),
      body: const PDF().cachedFromUrl(
        url,
        placeholder: (progress) => Center(child: Text('$progress %')),
        errorWidget: (error) => Center(
          child: Text(
            "No Upload Document"
          ),
        ),
      ),
    );
  }
}
