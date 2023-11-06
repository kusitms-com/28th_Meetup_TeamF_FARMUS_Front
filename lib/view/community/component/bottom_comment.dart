import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';

class BottomComment extends StatefulWidget {
  @override
  State<BottomComment> createState() => _BottomCommentState();
}

final int maxLength = 100;

class _BottomCommentState extends State<BottomComment> {
  String textValue = "";

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0, bottom: 16.0, right: 16.0),
          child: TextFormField(
            decoration: InputDecoration(
              hintText: '댓글을 입력하세요',
              hintStyle: TextStyle(
                color: FarmusThemeData.dark.withOpacity(0.3),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide.none,
              ),
              counterText: "",
              filled: true,
              fillColor: FarmusThemeData.background,
              suffix: Text("${textValue.length} / $maxLength"),
              suffixStyle: TextStyle(
                color: FarmusThemeData.dark.withOpacity(0.3),
              ),
              suffixIcon: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  "assets/image/ic_arrow_up.svg",
                ),
              ),
            ),
            maxLength: maxLength,
            onChanged: (value) {
              setState(() {
                textValue = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
