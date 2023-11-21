import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mojacknong_android/common/bouncing.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view_model/controllers/bottom_sheet_controller.dart';
import 'package:mojacknong_android/view_model/controllers/farmclub/farmclub_join_controller.dart';

class GreenButton extends StatefulWidget {
  final String title;

  const GreenButton({super.key, required this.title});

  @override
  State<GreenButton> createState() => _GreenButtonState();
}

class _GreenButtonState extends State<GreenButton> {
  BottomSheetController controller = BottomSheetController();
  final FarmclubJoinController joinController = Get.put(FarmclubJoinController());

  @override
  Widget build(BuildContext context) {
    return Bouncing(
      onPress: () {},
      child: GestureDetector(
        onTap: () async {
          await joinController.getVeggieRegistration();
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
