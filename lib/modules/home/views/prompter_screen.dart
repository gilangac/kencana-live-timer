import 'package:flutter/material.dart';
import 'package:kencana_live_timer/modules/home/controllers/home_controller.dart';
import 'package:kencana_live_timer/themes/theme.dart';
import 'package:kencana_live_timer/utils/sizes.dart';
import 'package:get/get.dart';

class PrompterScreen extends StatelessWidget {
  const PrompterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeC = Get.find();
    return Container(
      padding: EdgeInsets.all(Sizes.s25),
      margin: EdgeInsets.only(
          right: Sizes.s50, left: Sizes.s50, top: Sizes.s55, bottom: Sizes.s20),
      height: Get.height,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            blurRadius: 1,
            blurStyle: BlurStyle.outer,
            spreadRadius: 1,
            color: AssetColor.inverseSurfaceLight.withOpacity(0.3))
      ], borderRadius: BorderRadius.circular(Sizes.s12), color: Colors.white),
      child: TextField(
        controller: homeC.prompterFC,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: FontSize.s40,
            fontWeight: FontWeight.w700,
            letterSpacing: 2,
            wordSpacing: 2),
        maxLines: 100,
        decoration: const InputDecoration(
            focusedErrorBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            border: InputBorder.none,
            hintText: "INPUT TEXT",
            hintStyle: TextStyle(color: AppColor.blackgrey)),
      ),
    );
  }
}
