import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/common/primary_app_bar.dart';
import 'package:mojacknong_android/view/community/component/image_add.dart';

class WriteDiary extends StatefulWidget {
  const WriteDiary({Key? key}) : super(key: key);

  @override
  _WriteDiaryState createState() => _WriteDiaryState();
}

const int maxLengthTitle = 20;
const int maxLengthContent = 500;

class _WriteDiaryState extends State<WriteDiary> {
  // final CommunityPostController postController =
  //     Get.put(CommunityPostController());

  // final CommunityFeedController communityFeedController =
  //     Get.put(CommunityFeedController());
  final TextEditingController _contentController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  File? _selectedImage;

  get communityFeedController => null;

  @override
  void initState() {
    super.initState();
    // TextEditingController에 리스너 추가하여 상태를 업데이트합니다.
    _contentController.addListener(() {
      setState(() {}); // 화면을 새로고침하여 글자 수를 업데이트합니다.
    });
  }

  void _getImageFromGallery(ImageSource source) async {
    final XFile? pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
      // postController.setImageFile(File(pickedFile.path));
    }
  }

  late List<bool> isSelected = [false, false, false];

  @override
  Widget build(BuildContext context) {
    print("이미지 업로드");
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: FarmusThemeData.white,
      appBar: PrimaryAppBar(
        title: "일기 작성하기",
        actions: [
          TextButton(
            onPressed: () async {
              // "완료" 버튼을 눌렀을 때 postPostingWrite를 호출하고 결과를 받음
              String result = "";

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
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(
                  //       vertical: 16.0, horizontal: 8.0),
                  //   child: Align(
                  //     alignment: Alignment.bottomRight,
                  //     child: Padding(
                  //       padding: const EdgeInsets.only(right: 8.0),
                  //       child: Obx(
                  //         () => Text(
                  //           "${postController.contentValue.value.length} / $maxLengthContent",
                  //           style: TextStyle(
                  //             color: FarmusThemeData.dark.withOpacity(0.3),
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
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
                          : null,
                    ),
                  ),
                  TextFormField(
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
                    buildCounter: (BuildContext context,
                        {int? currentLength, bool? isFocused, int? maxLength}) {
                      return Text(
                        "$currentLength / $maxLength",
                        style: const TextStyle(
                          color: Colors
                              .grey, // Adjust the color to match your design
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//   Future<String> postPostingWrite(BuildContext context) async {
//     try {
//       Posting posting = Posting(
//         title: postController.titleValue.value,
//         contents: postController.contentValue.value,
//         tag: postController.selectedCategoryValue,
//         file: _selectedImage != null ? [_selectedImage!] : [],
//       );
//       String result = await CommunityRepository.postPostingWrite(posting);

//       if (result == "성공" && mounted) {
//         // CommunityScreen에서 전체 게시물을 다시 가져오기
//         await communityFeedController.getWholePosting();

//         // 게시가 성공하면 PostScreen을 네비게이션 스택에서 제거
//         Navigator.pop(context);
//       }

//       return "result";
//     } on DioError catch (e) {
//       print("에러 ${e.message}");
//       return "실패";
//     }
//   }
// }

