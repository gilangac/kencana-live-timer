import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kencana_live_timer/components/custom_button_outline.dart';
import 'package:kencana_live_timer/components/custom_button_primary.dart';
import 'package:kencana_live_timer/constant/directory_asset.dart';
import 'package:kencana_live_timer/modules/home/controllers/home_controller.dart';
import 'package:kencana_live_timer/themes/theme.dart';
import 'package:kencana_live_timer/utils/sizes.dart';
import 'package:get/get.dart';

class TimerScreen extends StatelessWidget {
  const TimerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeC = Get.find();
    return Container(
      color: Colors.transparent,
      child: Obx(() => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                homeC.isCount.value ? countDownTimer() : inputTimer(),
              ],
            ),
          )),
    );
  }

  Widget inputTimer() {
    HomeController homeC = Get.find();
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: Sizes.s15),
          child: Image.asset(
            DirectoryAsset.kencanaLiveLogo,
            height: Sizes.s180,
            fit: BoxFit.fitHeight,
          ),
        ),
        Container(
          width: Sizes.s465,
          padding: EdgeInsets.all(Sizes.s1),
          margin: EdgeInsets.only(
              right: Sizes.s50, left: Sizes.s50, bottom: Sizes.s20),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    blurRadius: 1,
                    blurStyle: BlurStyle.outer,
                    spreadRadius: 1,
                    color: AssetColor.inverseSurfaceLight.withOpacity(0.3))
              ],
              borderRadius: BorderRadius.circular(Sizes.s12),
              color: Colors.white),
          child: TextField(
            controller: homeC.mainFC,
            textAlign: TextAlign.center,
            style:
                TextStyle(fontSize: FontSize.s20, fontWeight: FontWeight.w600),
            maxLines: 1,
            decoration: InputDecoration(
                focusedErrorBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                border: InputBorder.none,
                hintText: "INPUT TEXT",
                hintStyle: TextStyle(
                    color: AppColor.blackgrey,
                    fontSize: FontSize.s20,
                    fontWeight: FontWeight.w600)),
          ),
        ),
        SizedBox(
          height: Sizes.s20,
        ),
        Text(
          "INPUT WAKTU",
          style: TextStyle(fontSize: FontSize.s32, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: Sizes.s20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TimeInputWidget(
              label: "JAM",
              controller: homeC.hoursFC,
            ),
            TimeInputWidget(
              label: "MENIT",
              controller: homeC.minutesC,
            ),
            TimeInputWidget(
              label: "DETIK",
              controller: homeC.secondsC,
            ),
          ],
        ),
        SizedBox(
          height: Sizes.s30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                height: Sizes.s48,
                width: Sizes.s120,
                child: CustomButtonPrimary(
                  text: "Mulai",
                  onPress: () => homeC.onStartCount(),
                )),
            SizedBox(
              width: Sizes.s14,
            ),
            SizedBox(
                height: Sizes.s48,
                width: Sizes.s120,
                child: CustomButtonOutline(
                  text: "Reset",
                  onPress: () => homeC.onReset(),
                ))
          ],
        ),
        SizedBox(
          height: Sizes.s30,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: Sizes.s15),
          child: Image.asset(
            DirectoryAsset.ghostNoteLogo,
            height: Sizes.s120,
            fit: BoxFit.fitHeight,
          ),
        ),
      ],
    );
  }

  Widget countDownTimer() {
    HomeController homeC = Get.find();
    return Center(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: Sizes.s15),
            child: Image.asset(
              DirectoryAsset.kencanaLiveLogo,
              height: Sizes.s140,
              fit: BoxFit.fitHeight,
            ),
          ),
          Text(
            homeC.mainFC.text,
            style:
                TextStyle(fontSize: FontSize.s40, fontWeight: FontWeight.w700),
          ),
          Container(
            height: Sizes.s400,
            alignment: Alignment.topCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      "${homeC.myDuration.value?.inHours.remainder(24).toString().padLeft(2, "0")}",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: FontSize.s360,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Text(
                  ":",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: FontSize.s360,
                      fontWeight: FontWeight.bold),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      "${homeC.myDuration.value?.inMinutes.remainder(60).toString().padLeft(2, "0")}",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: FontSize.s360,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Text(
                  ":",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: FontSize.s360,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: Sizes.s30,
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      "${homeC.myDuration.value?.inSeconds.remainder(60).toString().padLeft(2, "0")}",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: FontSize.s360,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: Sizes.s30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  height: Sizes.s48,
                  width: Sizes.s120,
                  child: CustomButtonPrimary(
                    text: "Stop",
                    onPress: () => homeC.onStopCount(),
                  )),
              SizedBox(
                width: Sizes.s14,
              ),
              SizedBox(
                  height: Sizes.s48,
                  width: Sizes.s120,
                  child: CustomButtonOutline(
                    text: "Ulangi",
                    onPress: () => homeC.onRepeat(),
                  ))
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: Sizes.s30),
            child: Image.asset(
              DirectoryAsset.ghostNoteLogo,
              height: Sizes.s100,
              fit: BoxFit.fitHeight,
            ),
          ),
        ],
      ),
    );
  }
}

class TimeInputWidget extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  const TimeInputWidget(
      {super.key, required this.label, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(Sizes.s12),
          height: Sizes.s136,
          width: Sizes.s136,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    blurRadius: 1,
                    blurStyle: BlurStyle.outer,
                    spreadRadius: 1,
                    color: AssetColor.inverseSurfaceLight.withOpacity(0.3))
              ],
              borderRadius: BorderRadius.circular(Sizes.s12),
              color: AssetColor.backgroundLight),
          child: Center(
            child: TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              maxLength: 2,
              decoration: InputDecoration(
                  focusedErrorBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  border: InputBorder.none,
                  hintText: "00",
                  counterText: "",
                  hintStyle: TextStyle(
                      color: AppColor.blackgrey,
                      fontSize: FontSize.s64,
                      fontWeight: FontWeight.bold)),
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              style: TextStyle(
                  fontSize: FontSize.s64, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Text(
          label,
          style: TextStyle(fontSize: FontSize.s32, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
