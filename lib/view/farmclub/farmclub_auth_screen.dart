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
import 'package:mojacknong_android/view_model/controllers/farmclub/farmclub_controller.dart';

class FarmclubAuthScreen extends StatefulWidget {
  const FarmclubAuthScreen({super.key});

  @override
  State<FarmclubAuthScreen> createState() => _FarmclubAuthScreenState();
}

class _FarmclubAuthScreenState extends State<FarmclubAuthScreen> {
  FarmclubController farmclubController = Get.put(FarmclubController());
  BottomSheetController bottomSheetController =
      Get.put(BottomSheetController());

  final ImagePicker _picker = ImagePicker();
  File? _selectedImage;

  void _getImageFromGallery(ImageSource source) async {
    final XFile? pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }

    farmclubController.image.value = _selectedImage;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        title: "미션 인증",
      ),
      backgroundColor: FarmusThemeData.white,
      body: Column(
        children: [
          const SizedBox(
            height: 8,
          ),
          const ChallengeStep(step: 0, title: "준비물을 챙겨요"),
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
              onChanged: farmclubController.updateContentValue,
            ),
          ),
        ],
      ),
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
                      "${farmclubController.contentValue.value.length} / 50",
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
              enabled: farmclubController.isFormVaild,
              onPress: () {
                Navigator.pop(context);
                bottomSheetController.showAuthDialog(
                    context, "상추 좋아하세요", "Step 0을 완료했어요");
              },
            ),
          ],
        ),
      ),
    );
  }
}
