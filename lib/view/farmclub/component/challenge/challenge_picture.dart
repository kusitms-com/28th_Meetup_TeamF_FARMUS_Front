import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view/farmclub/farmclub_mission_feed_screen.dart';
import 'package:mojacknong_android/view_model/controllers/farmclub/farmclub_controller.dart';

class ChallengePicture extends StatefulWidget {
  final String? registrationId;
  final int? challengeId;
  final int? stepNum;

  const ChallengePicture({
    super.key,
    this.registrationId,
    this.challengeId,
    this.stepNum,
  });

  @override
  State<ChallengePicture> createState() => _ChallengePictureState();
}

class _ChallengePictureState extends State<ChallengePicture> {
  FarmclubController _farmclubController = Get.put(FarmclubController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 16,
        ),
        Expanded(
          flex: 2,
          child: Obx(() {
            List<String?> stepImages =
                _farmclubController.farmclubInfo.value!.stepImages;
            return Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: FarmusThemeData.background,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: stepImages.length > 0 && stepImages[0] != null
                    ? Image.network(
                        stepImages[0]!,
                        fit: BoxFit.fill,
                        width: double.infinity,
                        height: double.infinity,
                      )
                    : Image.asset("assets/image/image_empty.png"),
              ),
            );
          }),
        ),
        const SizedBox(
          width: 4,
        ),
        Expanded(
          flex: 1,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 98,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: _farmclubController
                                  .farmclubInfo.value!.stepImages.length >
                              1 &&
                          _farmclubController
                                  .farmclubInfo.value!.stepImages[1] !=
                              null
                      ? Image.network(
                          _farmclubController
                              .farmclubInfo.value!.stepImages[1]!,
                          fit: BoxFit.fill,
                          width: double.infinity,
                          height: double.infinity,
                        )
                      : Image.asset("assets/image/image_empty.png"),
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return FarmclubMissionFeedScreen(
                          registrationId: widget.registrationId,
                          challengeId: _farmclubController
                              .myFarmclubState[_farmclubController
                                  .selectedFarmclubIndex
                                  .toInt()]
                              .challengeId
                              .toInt(),
                          stepNum: _farmclubController
                              .farmclubInfo.value!.stepNum
                              .toInt(),
                        );
                      },
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 98,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Stack(
                      children: [
                        _farmclubController
                                        .farmclubInfo.value!.stepImages.length >
                                    2 &&
                                _farmclubController
                                        .farmclubInfo.value!.stepImages[2] !=
                                    null
                            ? Image.network(
                                _farmclubController
                                    .farmclubInfo.value!.stepImages[2]!,
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity,
                              )
                            : Image.asset("assets/image/image_empty.png"),
                        Positioned.fill(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.5),
                            ),
                            child: const Center(
                              child: Text(
                                "더보기",
                                style: FarmusThemeData.whiteStyle14,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 16,
        ),
      ],
    );
  }
}
