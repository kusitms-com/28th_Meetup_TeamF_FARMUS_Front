import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/bouncing.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view_model/controllers/bottom_sheet_controller.dart';

class GreenButton extends StatefulWidget {
  final String title;

  const GreenButton({super.key, required this.title});

  @override
  State<GreenButton> createState() => _GreenButtonState();
}

class _GreenButtonState extends State<GreenButton> {
  BottomSheetController controller = BottomSheetController();

  @override
  Widget build(BuildContext context) {
    return Bouncing(
      onPress: () {},
      child: GestureDetector(
        onTap: () {
          controller.showFarmclubJoinBottomSheet(context, widget.title);
        },
        child: Container(
          width: 45,
          height: 30,
          decoration: BoxDecoration(
            color: FarmusThemeData.greenLight,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Center(
            child: Text(
              "참여",
              style: FarmusThemeData.green1Style14,
            ),
          ),
        ),
      ),
    );
  }
}
