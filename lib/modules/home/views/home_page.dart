import 'package:flutter/material.dart';
import 'package:kencana_live_timer/components/custom_tabbar.dart';
import 'package:kencana_live_timer/constant/directory_asset.dart';
import 'package:kencana_live_timer/modules/home/views/preview_screen.dart';
import 'package:kencana_live_timer/modules/home/views/prompter_screen.dart';
import 'package:kencana_live_timer/modules/home/views/timer_screen.dart';
import 'package:kencana_live_timer/themes/theme.dart';
import 'package:kencana_live_timer/utils/sizes.dart';
import 'package:window_manager/window_manager.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: Sizes.s80,
        backgroundColor: Colors.white,
        elevation: 4,
        title: const Text(
          "KENCANA LIVE SHOW MANAGEMENT",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: "inter",
          ),
        ),
        actions: [
          Padding(
              padding: EdgeInsets.symmetric(
                  vertical: Sizes.s10, horizontal: Sizes.s20),
              child: Opacity(
                  opacity: 0.8,
                  child: Container(
                      margin:
                          EdgeInsets.only(right: Sizes.s12, bottom: Sizes.s12),
                      height: Sizes.s50,
                      child: Image.asset(DirectoryAsset.seovLogo)))),
        ],
      ),
      floatingActionButton: GestureDetector(
        onTap: () async {
          await windowManager.close();
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Sizes.s12),
              color: AssetColor.error),
          child: Text(
            "Keluar",
            style: TextStyle(
                color: Colors.white,
                fontSize: FontSize.s22,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: DefaultTabController(
        length: 3,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                DirectoryAsset.mainBg,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  child: TabBarView(children: [
                TimerScreen(),
                PrompterScreen(),
                PreviewScreen()
              ])),
              CustomTabBar(
                data: ["Timer", "Text Prompter", "Preview"],
              )
            ],
          ),
        ),
      ),
    );
  }
}
