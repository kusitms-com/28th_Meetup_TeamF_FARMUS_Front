import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/common/primary_app_bar.dart';
import 'package:mojacknong_android/view/community/component/image_add.dart';
import 'package:mojacknong_android/view/farmclub/component/button_brown.dart';
import 'package:mojacknong_android/view/farmclub/component/challenge/challenge_step.dart';
import 'package:mojacknong_android/view_model/controllers/bottom_sheet_controller.dart';
import 'package:mojacknong_android/view_model/controllers/farmclub/farmclub_auth_controller.dart';
import 'package:mojacknong_android/view_model/controllers/farmclub/farmclub_controller.dart';
import 'package:mojacknong_android/view_model/controllers/farmclub/farmclub_etc_controller.dart';

import '../../model/farmclub_mine.dart';

class FarmclubAuthScreen extends StatefulWidget {
  final List<FarmclubMine> farmclubData;

  const FarmclubAuthScreen({
    Key? key,
    required this.farmclubData,
  }) : super(key: key);

  @override
  State<FarmclubAuthScreen> createState() => _FarmclubAuthScreenState();
}

class _FarmclubAuthScreenState extends State<FarmclubAuthScreen> {
  FarmclubAuthController _authController = Get.put(FarmclubAuthController());
  FarmclubController _farmclubController = Get.put(FarmclubController());
  BottomSheetController bottomSheetController =
      Get.put(BottomSheetController());

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    try {
      _farmclubController.getMyFarmclub();
    } catch (error) {
      print('Error fetching farmclub data: $error');
    }
  }

  final ImagePicker _picker = ImagePicker();
  File? _selectedImage;

  void _getImageFromGallery(ImageSource source) async {
    final XFile? pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }

    _authController.image.value = _selectedImage;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        title: "미션 인증",
      ),
      backgroundColor: FarmusThemeData.white,
      body: Obx(() {
        if (_authController.isLoading.isTrue ||
            _farmclubController.isLoading.isTrue) {
          return Center(child: CircularProgressIndicator());
        }

        final farmclubMission = _farmclubController.farmclubInfo.value;
        if (farmclubMission == null) {
          // farmclubMission이 null인 경우 처리
          return Center(child: Text('데이터가 없습니다.'));
        }

        return Column(
          children: [
            const SizedBox(
              height: 8,
            ),
            ChallengeStep(
              step: farmclubMission.stepNum.toInt(),
              title: farmclubMission.stepName,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GestureDetector(
                onTap: () {
                  _getImageFromGallery(
                    ImageSource.gallery,
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 248,
                  decoration: BoxDecoration(
                    color: FarmusThemeData.pictureBackground,
                    borderRadius: BorderRadius.circular(16),
                    image: _selectedImage != null
                        ? DecorationImage(
                            image: FileImage(_selectedImage!),
                            fit: BoxFit.cover,
                          )
                        : null,
                  ),
                  child: _selectedImage == null
                      ? const Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ImageAdd(
                                title: "인증 사진 추가하기",
                              ),
                            ],
                          ),
                        )
                      : null,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextFormField(
                maxLines: null,
                decoration: const InputDecoration(
                  hintText: '인증 글을 작성해주세요',
                  hintStyle: FarmusThemeData.grey2Style13,
                  counterText: "",
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                ),
                maxLength: 50,
                onChanged: _authController.updateContentValue,
              ),
            ),
          ],
        );
      }),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Expanded(
                child: SizedBox(
              height: 0,
            )),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Obx(
                    () => Text(
                      "${_authController.contentValue.value.length} / 50",
                      style: TextStyle(
                        color: FarmusThemeData.dark.withOpacity(0.3),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            ButtonBrown(
              text: "업로드하기",
              enabled: _authController.isFormValid,
              onPress: () async {
                await _authController.postFarmclubMission(
                  _farmclubController
                      .myFarmclubState[
                          _farmclubController.selectedFarmclubIndex.toInt()]
                      .registrationId,
                  _authController.contentValue.toString(),
                  _authController.image.value!,
                );
                Navigator.pop(context);
                // showAuthDialog 호출 시 데이터를 전달하여 렌더링
                bottomSheetController.showAuthDialog(
                  context,
                  _authController.farmclubMission.value?.image ?? '',
                  _authController.farmclubMission.value?.challengeName ?? '',
                  _authController.farmclubMission.value?.step.toString() ?? '',
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
