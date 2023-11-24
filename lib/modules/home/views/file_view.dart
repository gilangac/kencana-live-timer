import 'package:flutter/material.dart';
import 'package:kencana_live_timer/modules/home/controllers/file_view_controller.dart';
import 'package:pdfx/pdfx.dart';
import 'package:get/get.dart';

class FileViewPage extends StatelessWidget {
  final String path;
  const FileViewPage({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    Get.put(FileeViewController());
    return Scaffold(
        appBar: AppBar(
          title: Text(path.split("/").last),
          backgroundColor: Colors.white,
          elevation: 0.3,
        ),
        body: body(path.split(".").last));
  }

  Widget body(String format) {
    FileeViewController controller = Get.find();
    if (format == "pdf") {
      return PdfView(
        controller: controller.pdfController,
        onDocumentLoaded: (document) {},
        onPageChanged: (page) {},
      );
    } else {
      return SizedBox(
          height: Get.height,
          width: Get.width,
          child: InteractiveViewer(child: Image.asset(path)));
    }
  }
}
