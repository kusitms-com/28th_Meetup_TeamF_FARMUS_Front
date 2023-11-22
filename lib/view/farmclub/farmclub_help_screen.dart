import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mojacknong_android/common/custom_app_bar.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view/farmclub/component/farmclub_help.dart';
import 'package:mojacknong_android/view_model/controllers/crop/crop_help_controller.dart';

import '../../view_model/controllers/crop/crop_info_step_controller.dart';

class FarmclubHelpScreen extends StatefulWidget {
  final String veggieInfoId;

  const FarmclubHelpScreen({
    Key? key,
    required this.veggieInfoId,
  }) : super(key: key);

  @override
  State<FarmclubHelpScreen> createState() => _FarmclubHelpScreenState();
}

class _FarmclubHelpScreenState extends State<FarmclubHelpScreen> {
  CropInfoStepController _cropInfoStepController =
      Get.put(CropInfoStepController());
  CropHelpController _cropHelpController = Get.put(CropHelpController());

  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  Future<void> _initializeData() async {
    await _cropInfoStepController.getCropInfoStep();
    _cropHelpController.veggieInfoId.value = _cropInfoStepController.veggieInfoId.value.toString();
    await _cropHelpController.getCropWholeHint();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      backgroundColor: FarmusThemeData.white,
      body: Obx(() {
        if (_cropHelpController.cropWholeHints.isEmpty) {
          return Center(
            child: CircularProgressIndicator(
              color: FarmusThemeData.brown,
            ),
          );
        } else {
          return SingleChildScrollView(
            child: Column(
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
                // Expanded 제거
                SingleChildScrollView(
                  child: Column(
                    children: _cropHelpController.cropWholeHints
                        .map(
                          (hint) => FarmclubHelp(
                            step: hint.num,
                            title: hint.content,
                            tips: hint.tips,
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            ),
          );
        }
      }),
    );
  }
}
