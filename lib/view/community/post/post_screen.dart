import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/common/primary_app_bar.dart';
import 'package:mojacknong_android/model/posting.dart';
import 'package:mojacknong_android/repository/community_repository.dart';
import 'package:mojacknong_android/view/community/component/category_list.dart';
import 'package:mojacknong_android/view_model/controllers/community_feed_controller.dart';
import 'package:mojacknong_android/view_model/controllers/community_post_controller.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  _PostScreenState createState() => _PostScreenState();
}

final int maxLengthTitle = 20;
final int maxLengthContent = 500;

class _PostScreenState extends State<PostScreen> {
  final CommunityPostController postController =
      Get.put(CommunityPostController());

  final CommunityFeedController communityFeedController =
      Get.put(CommunityFeedController());

  final ImagePicker _picker = ImagePicker();
  File? _selectedImage;

  void _getImageFromGallery(ImageSource source) async {
    final XFile? pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
      postController.setImageFile(File(pickedFile.path));
    }
  }

  late List<bool> isSelected = [false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: FarmusThemeData.white,
      appBar: PrimaryAppBar(
        actions: [
          TextButton(
            onPressed: () async {
              // "완료" 버튼을 눌렀을 때 postPostingWrite를 호출하고 결과를 받음
              String result = await postPostingWrite(context);

              // postPostingWrite가 완료되면 Navigator.pop 실행
              if (result == "성공") {
                Navigator.pop(context);
              }
            },
            child: const Text(
              "완료",
              style: TextStyle(
                color: FarmusThemeData.dark,
                fontSize: 14,
                fontFamily: "Pretendard",
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "태그",
                        style: TextStyle(
                          color: FarmusThemeData.grey2,
                          fontSize: 14,
                          fontFamily: "Pretendard",
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      CategoryList(),
                    ],
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: '제목',
                      hintStyle: TextStyle(
                        color: FarmusThemeData.dark.withOpacity(0.3),
                      ),
                      counterText: "",
                      suffix: Obx(() => Text(
                          "${postController.titleValue.value.length} / $maxLengthTitle")),
                      suffixStyle: TextStyle(
                        color: FarmusThemeData.dark.withOpacity(0.3),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: FarmusThemeData.grey2),
                      ),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: FarmusThemeData.grey2),
                      ),
                    ),
                    maxLength: maxLengthTitle,
                    onChanged: postController.updateTitleValue,
                  ),
                  TextFormField(
                    maxLines: null,
                    decoration: InputDecoration(
                      hintText: '내용을 작성해주세요.',
                      hintStyle: TextStyle(
                        color: FarmusThemeData.dark.withOpacity(0.3),
                      ),
                      counterText: "",
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                    ),
                    maxLength: maxLengthContent,
                    onChanged: postController.updateContentValue,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 8.0),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Obx(
                          () => Text(
                            "${postController.contentValue.value.length} / $maxLengthContent",
                            style: TextStyle(
                              color: FarmusThemeData.dark.withOpacity(0.3),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  GestureDetector(
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
                          ? Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    "assets/image/ic_camera.svg",
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  const Text(
                                    "사진 추가하기",
                                    style: TextStyle(
                                      color: FarmusThemeData.grey2,
                                      fontSize: 14,
                                      fontFamily: "Pretendard",
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : null,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<String> postPostingWrite(BuildContext context) async {
    try {
      Posting posting = Posting(
        title: postController.titleValue.value,
        contents: postController.contentValue.value,
        tag: postController.selectedCategoryValue,
        file: _selectedImage != null ? [_selectedImage!] : [],
      );
      String result = await CommunityRepository.postPostingWrite(posting);

      if (result == "성공" && mounted) {
        // CommunityScreen에서 전체 게시물을 다시 가져오기
        await communityFeedController.getWholePosting();

        // 게시가 성공하면 PostScreen을 네비게이션 스택에서 제거
        Navigator.pop(context);
      }

      return "result";
    } on DioError catch (e) {
      print("에러 ${e.message}");
      return "실패";
    }
  }
}
