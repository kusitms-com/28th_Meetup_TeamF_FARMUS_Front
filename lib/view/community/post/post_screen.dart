import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/common/primary_app_bar.dart';
import 'package:mojacknong_android/view/community/component/community_category.dart';
import 'package:mojacknong_android/view_model/controllers/community_detail_controller.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  _PostScreenState createState() => _PostScreenState();
}

final int maxLength = 500;

class _PostScreenState extends State<PostScreen> {
  final CommunityDetailController _controller =
      Get.put(CommunityDetailController());
  final int maxLength = 500;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        actions: [
          TextButton(
            onPressed: () {},
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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Text(
                    "태그",
                    style: TextStyle(
                      color: FarmusThemeData.grey2,
                      fontSize: 14,
                      fontFamily: "Pretendard",
                    ),
                  ),
                  CommunityCategory(category: "category"),
                  CommunityCategory(category: "category"),
                  CommunityCategory(category: "category"),
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
                      "${_controller.textValue.value.length} / $maxLength")),
                  suffixStyle: TextStyle(
                    color: FarmusThemeData.dark.withOpacity(0.3),
                  ),
                ),
                maxLength: maxLength,
                onChanged: _controller.updateTextValue,
              ),
              Expanded(
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    TextFormField(
                      maxLines: null,
                      decoration: InputDecoration(
                        hintText: '내용을 작성해주세요.',
                        hintStyle: TextStyle(
                          color: FarmusThemeData.dark.withOpacity(0.3),
                        ),
                        counterText: "",
                      ),
                      expands: true,
                      maxLength: maxLength,
                      onChanged: _controller.updateTextValue,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 8.0),
                      child: Obx(
                        () => Text(
                          "${_controller.textValue.value.length} / $maxLength",
                          style: TextStyle(
                            color: FarmusThemeData.dark.withOpacity(0.3),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
