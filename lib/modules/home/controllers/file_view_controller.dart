import 'package:get/get.dart';
import 'package:pdfx/pdfx.dart';

class FileeViewController extends GetxController {
  PdfController pdfController =
      PdfController(document: PdfDocument.openFile(Get.arguments));

  @override
  void onInit() {
    super.onInit();
  }
}
