import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kencana_live_timer/themes/theme.dart';
import 'package:kencana_live_timer/utils/sizes.dart';

class CustomButtonPrimary extends StatelessWidget {
  final String text;
  final Function()? onPress;
  final EdgeInsetsGeometry? margin;
  final double? width;
  final IconData? icon;
  final bool enabled;

  const CustomButtonPrimary({
    Key? key,
    required this.text,
    this.onPress,
    this.width = double.infinity,
    this.margin = EdgeInsets.zero,
    this.enabled = true,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      margin: margin,
      child: enabled
          ? ElevatedButton(
              onPressed: onPress,
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Sizes.s24),
                side:
                    BorderSide(color: AssetColor.primaryLight, width: Sizes.s2),
              ))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null)
                    Padding(
                      padding: EdgeInsets.only(right: Sizes.s10),
                      child: Icon(icon),
                    ),
                  Text(
                    text,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: FontSize.s18,
                      fontWeight: FontWeight.bold,
                      color: AssetColor.backgroundLight,
                    ),
                  ),
                ],
              ),
            )
          : ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Get.theme.colorScheme.surfaceTint,
              ),
              child: Text(
                text,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: FontSize.s18,
                  fontWeight: FontWeight.w700,
                  color: Get.theme.colorScheme.inverseSurface,
                ),
              ),
            ),
    );
  }
}
