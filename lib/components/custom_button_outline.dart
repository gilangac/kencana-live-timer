import 'package:flutter/material.dart';
import 'package:kencana_live_timer/themes/theme.dart';
import 'package:kencana_live_timer/utils/sizes.dart';

class CustomButtonOutline extends StatelessWidget {
  final String text;
  final Function()? onPress;
  final EdgeInsetsGeometry? margin;
  final double width;

  const CustomButtonOutline(
      {Key? key,
      required this.text,
      this.onPress,
      this.width = double.infinity,
      this.margin = EdgeInsets.zero})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      margin: margin,
      child: OutlinedButton(
        onPressed: onPress,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(Sizes.s24),
                    side: BorderSide(
                        color: AssetColor.primaryLight, width: Sizes.s2)))),
        child: Text(
          text,
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: FontSize.s18,
            fontWeight: FontWeight.bold,
            color: AssetColor.primaryLight,
          ),
        ),
      ),
    );
  }
}
