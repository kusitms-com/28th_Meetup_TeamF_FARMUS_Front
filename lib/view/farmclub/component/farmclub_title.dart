import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mojacknong_android/common/bouncing.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view_model/controllers/bottom_sheet_controller.dart';

class FarmclubTitle extends StatefulWidget {
  const FarmclubTitle({super.key});

  @override
  State<FarmclubTitle> createState() => _FarmclubTitleState();
}

class _FarmclubTitleState extends State<FarmclubTitle> {
  BottomSheetController bottomSheetController = BottomSheetController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                "상추 좋아하세요",
                style: FarmusThemeData.darkStyle18,
              ),
              const SizedBox(
                width: 8,
              ),
              SvgPicture.asset("assets/image/line_vertical_grey1.svg"),
              const SizedBox(
                width: 8,
              ),
              const Text(
                "상추",
                style: FarmusThemeData.darkStyle13,
              ),
              const Spacer(),
              Bouncing(
                onPress: () {},
                child: GestureDetector(
                  onTap: () {
                    bottomSheetController.showFarmclubExitBottomSheet(
                        context, "");
                  },
                  child: SvgPicture.asset(
                    "assets/image/ic_more_vertical.svg",
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
