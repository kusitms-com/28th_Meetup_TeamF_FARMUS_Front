import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mojacknong_android/common/bouncing.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view/farmclub/component/button_brown.dart';
import 'package:mojacknong_android/view_model/controllers/bottom_sheet_controller.dart';
import 'package:mojacknong_android/view_model/controllers/farmclub_controller.dart';

class BottomSheetFarmclubExit extends StatefulWidget {
  const BottomSheetFarmclubExit({super.key});

  @override
  State<BottomSheetFarmclubExit> createState() =>
      _BottomSheetFarmclubExitState();
}

class _BottomSheetFarmclubExitState extends State<BottomSheetFarmclubExit> {
  final FarmclubController _farmclubController = Get.find();
  BottomSheetController _bottomSheetController = BottomSheetController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(
          height: 30,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 32),
          child: Text("팜클럽을 나가시겠어요?", style: FarmusThemeData.darkStyle18),
        ),
        SizedBox(
          height: 16,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset("assets/image/ic_alert_circle.svg"),
              SizedBox(
                width: 4,
              ),
              Text(
                "지금까지의 팜클럽 기록이 모두 사라져요",
                style: FarmusThemeData.redStyle,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Container(
            child: Row(
              children: [
                Expanded(
                  child: Bouncing(
                    child: GestureDetector(
                      onTap: () {
                        _farmclubController.toggleSelectTextBox(0);
                        _farmclubController.toggleShouldExit();
                      },
                      child: Obx(
                        () => Container(
                          width: double.infinity,
                          height: 140,
                          decoration: BoxDecoration(
                            color: _farmclubController.isTextBox1Selected.value
                                ? FarmusThemeData.background
                                : FarmusThemeData.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: FarmusThemeData.grey4),
                          ),
                          child: Center(
                            child: Text(
                              "채소를 더 이상\n키우지 않아요",
                              style: FarmusThemeData.darkStyle14,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Bouncing(
                    child: GestureDetector(
                      onTap: () {
                        _farmclubController.toggleSelectTextBox(1);
                        _farmclubController.toggleShouldExit();
                      },
                      child: Obx(
                        () => Container(
                          width: double.infinity,
                          height: 140,
                          decoration: BoxDecoration(
                            color: _farmclubController.isTextBox2Selected.value
                                ? FarmusThemeData.background
                                : FarmusThemeData.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: FarmusThemeData.grey4),
                          ),
                          child: Center(
                            child: Text(
                              "채소는 계속\n키우지만 팜클럽은\n나가고 싶어요",
                              style: FarmusThemeData.darkStyle14,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Obx(() => ButtonBrown(
                text: "나가기",
                enabled: (_farmclubController.isTextBox1Selected.value ||
                        _farmclubController.isTextBox2Selected.value)
                    .obs,
                onPress: () {
                  print("버튼");
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                },
              )),
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
