import 'package:flutter/material.dart';
import 'package:kencana_live_timer/components/custom_tabbar.dart';
import 'package:kencana_live_timer/constant/directory_asset.dart';
import 'package:kencana_live_timer/modules/home/views/preview_screen.dart';
import 'package:kencana_live_timer/modules/home/views/prompter_screen.dart';
import 'package:kencana_live_timer/modules/home/views/timer_screen.dart';
import 'package:kencana_live_timer/utils/sizes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: Sizes.s80,
        backgroundColor: Colors.white,
        elevation: 0.3,
        title: const Text(
          "KENCANA LIVE TIMER",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: "inter",
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: Sizes.s15),
            child: Image.asset(
              DirectoryAsset.ghostNoteLogo,
              height: Sizes.s10,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                right: Sizes.s20,
                top: Sizes.s10,
                bottom: Sizes.s10,
                left: Sizes.s8),
            child: Image.asset(DirectoryAsset.kencanaLiveLogo),
          ),
        ],
      ),
      floatingActionButton: Opacity(
        opacity: 0.7,
        child: Container(
            margin: EdgeInsets.only(right: Sizes.s12, bottom: Sizes.s12),
            height: Sizes.s40,
            child: Image.asset(DirectoryAsset.seovLogo)),
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
