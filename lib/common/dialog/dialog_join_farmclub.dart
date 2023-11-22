import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';

class DialogJoinFarmclub extends StatefulWidget {
  final String image;
  final String title;
  final String content;

  const DialogJoinFarmclub({
    super.key,
   required  this.image,
    required this.title,
    required this.content,
  });

  @override
  State<DialogJoinFarmclub> createState() => _DialogJoinFarmclubState();
}

class _DialogJoinFarmclubState extends State<DialogJoinFarmclub> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: AlertDialog(
        backgroundColor: FarmusThemeData.white,
        actions: <Widget>[
          Container(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Center(
                    child: SizedBox(
                      height: 30,
                    ),
                  ),
                  widget.image != ""
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.network(
                            widget.image,
                            width: 100,
                            height: 100,
                          ),
                        )
                      : SvgPicture.asset(
                          "assets/image/ic_lettuce_blue.svg",
                        ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    widget.title,
                    style: FarmusThemeData.grey1Style14,
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/image/ic_join_check.svg",
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        widget.content,
                        style: FarmusThemeData.darkStyle16,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
