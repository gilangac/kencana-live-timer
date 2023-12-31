import 'dart:async';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final TextEditingController mainFC = TextEditingController();
  final TextEditingController prompterFC = TextEditingController();

  final TextEditingController hoursFC = TextEditingController();
  final TextEditingController minutesC = TextEditingController();
  final TextEditingController secondsC = TextEditingController();

  final List<File> listPreview = [];
  final List<File> listPreviewName = [];
  final time = '00.00'.obs;

  int remainingSeconds = 1;
  Timer? countdownTimer;

  var isCount = false.obs;
  var isPause = false.obs;
  var myDuration = Rxn<Duration>();

  int sencondsRunning = 0;

  void onStartCount() async {
    if (hoursFC.text == "" && minutesC.text == "" && secondsC.text == "") {
      Get.snackbar("Input Waktu", "Masukkan waktu terlebih dahulu!");
    } else {
      isCount.value = true;
      startTimer();
    }
  }

  void onStopCount() {
    isPause.value = false;
    isCount.value = false;
    countdownTimer!.cancel();
  }

  void onRepeat() {
    countdownTimer!.cancel();
    startTimer();
  }

  void onPause() {
    isPause.value = !isPause.value;
    isPause.value ? countdownTimer!.cancel() : playTimer();
  }

  void onReset() {
    hoursFC.clear();
    minutesC.clear();
    secondsC.clear();
  }

  void playTimer() {
    myDuration.value = Duration(seconds: sencondsRunning);

    countdownTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }

  void startTimer() {
    isPause.value = false;
    myDuration.value = Duration(
        hours: int.parse(hoursFC.text != "" ? hoursFC.text : "0"),
        minutes: int.parse(minutesC.text != "" ? minutesC.text : "0"),
        seconds: int.parse(secondsC.text != "" ? secondsC.text : "0"));

    countdownTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }

  void setCountDown() {
    const reduceSecondsBy = 1;
    sencondsRunning = myDuration.value!.inSeconds - reduceSecondsBy;
    if (sencondsRunning < 0) {
      countdownTimer!.cancel();
    } else {
      myDuration.value = Duration(seconds: sencondsRunning);
    }
  }

  void stopTimer() {
    countdownTimer!.cancel();
  }

  void resetTimer() {
    stopTimer();
    myDuration.value = Duration(minutes: int.parse(minutesC.text));
  }

  Future<List> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowedExtensions: ['jpg', 'jpeg', 'png', 'heif', 'pdf'],
      type: FileType.custom,
    );

    if (result != null) {
      // File file = File(result.files.single.path!);
      // listPreview.add(File(file.path));
      // listPreviewName.add(File(result.files.single.name));
      return [result.files.single.path!, result.files.single.name];
    } else {
      return [];
    }
  }
}
