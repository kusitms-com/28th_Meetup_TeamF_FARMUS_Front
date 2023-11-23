import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/common/primary_app_bar.dart';
import 'package:mojacknong_android/view/community/component/image_add.dart';
import 'package:mojacknong_android/view/home/component/diary/diary_calendar.dart';
import 'package:mojacknong_android/view/home/component/diary/diary_post_controller.dart';
import 'package:mojacknong_android/view/home/component/mission_routine/custom_switch.dart';

import '../../../../view_model/controllers/diary_controller.dart';
import 'diary_calendar_notap.dart';

class WriteDiary extends StatefulWidget {
  final int? vegeId;
  const WriteDiary({
    Key? key,
    this.vegeId
  }) : super(key: key);

  @override
  _WriteDiaryState createState() => _WriteDiaryState();
}

const int maxLengthTitle = 20;
const int maxLengthContent = 300;

class _WriteDiaryState extends State<WriteDiary> {
  final DiaryPostController diaryPostController =
      Get.put(DiaryPostController());




  final TextEditingController _contentController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  File? _selectedImage;
  bool isSwitched = false;

  get communityFeedController => null;

  @override
  void initState() {
    super.initState();

    _contentController.addListener(() {
      setState(() {}); // 화면을 새로고침 글자 수를 업데이트
    });
  }

  void _getImageFromGallery(ImageSource source) async {
    final XFile? pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
        diaryPostController.updateImageBoolValue(true);

      });
      diaryPostController.setImageFile(File(pickedFile.path));
    }
  }

  late List<bool> isSelected = [false, false, false];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: FarmusThemeData.white,
      appBar: PrimaryAppBar(
        title: "일기 작성하기",
        actions: [
          TextButton(
            onPressed:
          diaryPostController.diaryWriteException()
            ?
          () async {

              await diaryPostController.writeDiaryRequest(widget.vegeId!);
              diaryPostController.updateContentValue("");
              diaryPostController.updateImageBoolValue(false);

              Navigator.pop(context, "data");

            }: null,
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
                  const DiaryCalendarNoTap(),
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
                          ? const Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ImageAdd(
                                    title: "사진 추가하기",
                                  ),
                                ],
                              ),
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.file(
                                _selectedImage!,
                                fit: BoxFit.fill,
                              ),
                            ),
                    ),
                  ),
                  SizedBox(
                    height: 230,
                    child: TextFormField(
                      controller: _contentController,
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
                      onChanged: diaryPostController.updateContentValue,
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomRight,
                    child: Obx(
                      () => Text(
                        "${diaryPostController.contentValue.value.length} / $maxLengthContent",
                        style: TextStyle(
                          color: FarmusThemeData.dark.withOpacity(0.3),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Divider(
                    color: Color(0xFFD9D9D9),
                    height: 1,
                    thickness: 1,
                  ),
                  const SizedBox(height: 25),
                  Row(
                    children: [
                      const Text(
                        "팜클럽에 공개하기",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      const Spacer(),

                      CustomSwitch(
                        value: isSwitched,
                        onChanged: (value) {
                          print(value);

                          setState(() {
                            isSwitched = value;
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  const Align(
                    alignment:
                        Alignment.centerLeft, // Aligns the child to the left
                    child: Text(
                      "클럽 멤버들이 나의 일기를 읽고 좋아요를 남길 수 있어요",
                      style:
                          TextStyle(fontSize: 13, color: FarmusThemeData.grey1),
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

//   Future<String> postPostingDiary(BuildContext context) async {
//     try {
//       String result = "";
//
//       if (result == "성공") {
//         // CommunityScreen에서 전체 게시물을 다시 가져오기
//         //await communityFeedController.getWholePosting();
//
//         // 게시가 성공하면 PostScreen을 네비게이션 스택에서 제거
//         Navigator.pop(context);
//       }
//
//       return "result";
//     } on DioError catch (e) {
//       print("에러 ${e.message}");
//       return "실패";
//     }
//   }
 }
