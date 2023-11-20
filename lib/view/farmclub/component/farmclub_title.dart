import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mojacknong_android/common/bouncing.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view_model/controllers/bottom_sheet_controller.dart';

class FarmclubTitle extends StatefulWidget {
  final String? title;
  final String? veggie;

  const FarmclubTitle({
    super.key,
    required this.title,
    required this.veggie,
  });

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
               Text(
                widget.title!,
                style: FarmusThemeData.darkStyle18,
              ),
              const SizedBox(
                width: 8,
              ),
              SvgPicture.asset("assets/image/line_vertical_grey1.svg"),
              const SizedBox(
                width: 8,
              ),
               Text(
                widget.veggie!,
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
