import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final TextEditingController mainFC = TextEditingController();
  final TextEditingController prompterFC = TextEditingController();

  final TextEditingController hoursFC = TextEditingController();
  final TextEditingController minutesC = TextEditingController();
  final TextEditingController secondsC = TextEditingController();

  var isCount = false.obs;

  var myDuration = Rxn<Duration>();
  final time = '00.00'.obs;

  int remainingSeconds = 1;
  Timer? countdownTimer;

  final List<File> listPreview = [];
  final List<File> listPreviewName = [];

  void onStartCount() {
    if (hoursFC.text == "" && minutesC.text == "" && secondsC.text == "") {
      Get.snackbar("Input Waktu", "Masukkan waktu terlebih dahulu!");
    } else {
      isCount.value = true;
      startTimer();
    }
  }

  void onStopCount() {
    isCount.value = false;
    countdownTimer!.cancel();
  }

  void onRepeat() {
    countdownTimer!.cancel();
    startTimer();
  }

  void onReset() {
    hoursFC.clear();
    minutesC.clear();
    secondsC.clear();
  }

  void startTimer() {
    myDuration.value = Duration(
        hours: int.parse(hoursFC.text != "" ? hoursFC.text : "0"),
        minutes: int.parse(minutesC.text != "" ? minutesC.text : "0"),
        seconds: int.parse(secondsC.text != "" ? secondsC.text : "0"));

    countdownTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }

  void setCountDown() {
    const reduceSecondsBy = 1;
    final seconds = myDuration.value!.inSeconds - reduceSecondsBy;
    if (seconds < 0) {
      countdownTimer!.cancel();
    } else {
      myDuration.value = Duration(seconds: seconds);
    }
  }

  void stopTimer() {
    countdownTimer!.cancel();
  }

  void resetTimer() {
    stopTimer();
    myDuration.value = Duration(minutes: int.parse(minutesC.text));
  }
}
