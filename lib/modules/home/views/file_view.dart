import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kencana_live_timer/modules/home/controllers/file_view_controller.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class FileViewPage extends StatelessWidget {
  final String path;
  final String name;
  const FileViewPage({super.key, required this.path, required this.name});

  @override
  Widget build(BuildContext context) {
    Get.put(FileeViewController());
    return Scaffold(
        appBar: AppBar(
          title: Text(name),
          backgroundColor: Colors.white,
          elevation: 0.3,
        ),
        body: body(path.split(".").last));
  }

  Widget body(String format) {
    if (format == "pdf") {
      return SfPdfViewer.file(
        File(path),
        scrollDirection: PdfScrollDirection.vertical,
      );
    } else if (format == "excel") {
      return Container();
    } else {
      return SizedBox(
          height: Get.height,
          width: Get.width,
          child: InteractiveViewer(child: Image.file(File(path))));
    }
  }
}
