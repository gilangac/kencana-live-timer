import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kencana_live_timer/themes/theme.dart';
import 'package:kencana_live_timer/utils/sizes.dart';

class CustomTabBar extends StatelessWidget {
  final List data;
  final Function(int)? onTap;
  final TabController? controller;
  final bool isMargin;

  const CustomTabBar(
      {Key? key,
      required this.data,
      this.onTap,
      this.isMargin = true,
      this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Sizes.s72,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizes.s12),
        color: AssetColor.backgroundLight,
      ),
      margin: isMargin
          ? EdgeInsets.symmetric(
              horizontal: Sizes.paddingHorizontalPage, vertical: Sizes.s20)
          : null,
      padding: EdgeInsets.all(Sizes.s4),
      child: TabBar(
        // tabAlignment: TabAlignment.center,
        labelPadding: EdgeInsets.zero,
        padding: EdgeInsets.all(Sizes.s4),
        isScrollable: false,
        // dividerHeight: 0,
        unselectedLabelColor: Get.theme.colorScheme.surface,
        labelColor: AssetColor.backgroundLight,
        labelStyle: Get.textTheme.bodyMedium!
            .copyWith(color: AssetColor.backgroundLight),
        indicatorSize: TabBarIndicatorSize.label,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Get.theme.colorScheme.primary,
        ),
        tabs: data.map(
          (e) {
            return Tab(
              child: Container(
                width: Sizes.s240,
                padding: EdgeInsets.symmetric(horizontal: Sizes.s16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                alignment: Alignment.center,
                child: Text(
                  e,
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.bold,
                      fontSize: FontSize.s20),
                ),
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
