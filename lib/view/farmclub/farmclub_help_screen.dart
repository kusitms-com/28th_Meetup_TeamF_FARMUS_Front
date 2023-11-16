import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mojacknong_android/common/custom_app_bar.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view/farmclub/component/farmclub_help.dart';

class FarmclubHelpScreen extends StatelessWidget {
  const FarmclubHelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      backgroundColor: FarmusThemeData.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 16,
                ),
                Text(
                  "도움말",
                  style: FarmusThemeData.darkStyle16,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SvgPicture.asset("assets/image/ic_close.svg"),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  FarmclubHelp(),
                  FarmclubHelp(),
                  FarmclubHelp(),
                  FarmclubHelp(),
                  FarmclubHelp(),
                  FarmclubHelp(),
                  FarmclubHelp(),
                  FarmclubHelp(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
