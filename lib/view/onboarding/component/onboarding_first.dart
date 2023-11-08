import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/repository/onboarding_repository.dart';
import 'package:mojacknong_android/view_model/controllers/onboarding_controller.dart';

class OnboardingFirst extends StatefulWidget {
  const OnboardingFirst({Key? key}) : super(key: key);

  @override
  _OnboardingFirstState createState() => _OnboardingFirstState();
}

class _OnboardingFirstState extends State<OnboardingFirst> {
  final OnboardingController _controller = Get.put(OnboardingController());
  final ImagePicker _picker = ImagePicker();
  String? _profileImage;

  @override
  void initState() {
    super.initState();
    _setInitialImage();
  }

  Future<void> _setInitialImage() async {
    String? profileImage = await getFirstProfileImage();
    if (profileImage != null) {
      setState(() {
        _profileImage = profileImage;
      });
    }
  }

  Future<void> _getImageFromGallery() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _profileImage = pickedFile.path;
      });
      _controller.setImageFile(File(pickedFile.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: GestureDetector(
                onTap: _getImageFromGallery,
                child: _profileImage != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(75),
                        child: _profileImage!.startsWith('http')
                            ? Image.network(
                                _profileImage!,
                                width: 118,
                                height: 118,
                                fit: BoxFit.cover,
                              )
                            : Image.file(
                                File(_profileImage!),
                                width: 118,
                                height: 118,
                                fit: BoxFit.cover,
                              ),
                      )
                    : SvgPicture.asset(
                        "assets/image/ic_profile.svg",
                        width: 118,
                        height: 118,
                      ),
              ),
            ),
            const SizedBox(height: 30),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "닉네임",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: FarmusThemeData.dark,
                    fontSize: 13,
                    fontFamily: "Pretendard",
                  ),
                ),
              ),
            ),
            Obx(
              () => TextFormField(
                controller: _controller.controller,
                maxLength: 10,
                decoration: InputDecoration(
                  hintText: "파머",
                  hintStyle: const TextStyle(
                    color: FarmusThemeData.grey3,
                    fontFamily: "Pretendard",
                  ),
                  errorText: _controller.hasSpecialCharacters.value
                      ? '특수문자는 입력할 수 없어요'
                      : null,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: FarmusThemeData.grey4,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: FarmusThemeData.grey4,
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: FarmusThemeData.grey4,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: FarmusThemeData.grey4,
                    ),
                  ),
                  errorStyle: const TextStyle(
                    color: FarmusThemeData.red,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 16.0,
                  ),
                ),
              ),
            ),
            SizedBox(height: 80),
          ],
        ),
      ),
    );
  }

  Future<String?> getFirstProfileImage() {
    return OnboardingRepository.profileImageApi();
  }
}
