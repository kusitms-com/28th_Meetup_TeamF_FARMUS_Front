import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view_model/controllers/farmclub_controller.dart';

class SearchEdit extends StatefulWidget {
  final Function()? onSubmitted;

  SearchEdit({
    Key? key,
    this.onSubmitted,
  }) : super(key: key);

  @override
  State<SearchEdit> createState() => _SearchEditState();
}

class _SearchEditState extends State<SearchEdit> {
  FarmclubController _controller = Get.put(FarmclubController());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        decoration: BoxDecoration(
          color: FarmusThemeData.background,
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/image/ic_search_small.svg"),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: TextField(
                onChanged: (value) {
                  _controller.updateKeyword(value);
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "팜클럽을 검색해 보세요",
                  hintStyle: TextStyle(
                    color: FarmusThemeData.grey3,
                    fontFamily: "Pretendard",
                    fontSize: 14,
                  ),
                ),
                cursorColor: FarmusThemeData.grey1,
                autofocus: true,
                onSubmitted: (String value) {
                  print("gg");

                  if (widget.onSubmitted != null) {
                    print("gg!!!!");

                    widget.onSubmitted!();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
