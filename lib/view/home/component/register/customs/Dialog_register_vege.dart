import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';

class DialogRegisterVege extends StatefulWidget {
  final String title;
  const DialogRegisterVege({super.key, required this.title});

  @override
  State<DialogRegisterVege> createState() => _DialogRegisterVegeState();
}

class _DialogRegisterVegeState extends State<DialogRegisterVege> {
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
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  SvgPicture.asset(
                    "assets/image/lettuce_col.svg",
                    height: 101,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    widget.title,
                    style: FarmusThemeData.grey1Style14,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/image/ic_join_check.svg",
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      const Text(
                        "채소가 등록되었어요",
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
