import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/common/primary_app_bar.dart';
import 'package:mojacknong_android/model/community_detail.dart';
import 'package:mojacknong_android/repository/community_repository.dart';
import 'package:mojacknong_android/view/community/component/bottom_comment.dart';
import 'package:mojacknong_android/view/community/component/community_content.dart';
import 'package:mojacknong_android/view/community/component/post_category.dart';
import 'package:mojacknong_android/view_model/controllers/bottom_sheet_controller.dart';

class DetailPostScreen extends StatefulWidget {
  final int postingId;

  const DetailPostScreen({
    Key? key,
    required this.postingId,
  }) : super(key: key);

  @override
  _DetailPostScreenState createState() => _DetailPostScreenState();
}

class _DetailPostScreenState extends State<DetailPostScreen> {
  final List<Widget> comments = [];
  final BottomSheetController _controller = Get.put(BottomSheetController());

  @override
  void initState() {
    super.initState();
    getPostingDetails();
  }

  Future<void> getPostingDetails() async {
    try {
      CommunityDetail response =
          await CommunityRepository.getPostingDetails(12);
      print(response);
    } catch (e) {
      print("에러 발생: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(actions: [
        IconButton(
          icon: SvgPicture.asset("assets/image/ic_more_vertical.svg"),
          onPressed: () {
            _controller.showCustomCupertinoActionSheet(context,
                message: "글 메뉴",
                options: ["수정", "삭제", "URL 공유"],
                cancelButtonText: "취소");
          },
        ),
      ]),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(8.0, 0, 8.0, 100),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.topRight,
                      child: PostCategory(
                        category: "ㅋㅋㅋㅋ",
                      ),
                    ),
                  ),
                ],
              ),
              CommunityContent(
                title: "ㅋㅋㅋㅋ",
                content: "ㅋㅋㅋㅋ",
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 8,
                  ),
                  const Text(
                    "댓글",
                    style: TextStyle(
                      color: FarmusThemeData.dark,
                      fontSize: 16,
                      fontFamily: "Pretendard",
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    comments.length.toString(),
                    style: const TextStyle(
                      color: FarmusThemeData.dark,
                      fontSize: 16,
                      fontFamily: "Pretendard",
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              ...comments,
            ],
          ),
        ),
      ),
      bottomSheet: BottomComment(),
    );
  }
}
