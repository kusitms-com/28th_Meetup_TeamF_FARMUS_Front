import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';

class NickNameVege extends StatefulWidget {
  const NickNameVege({Key? key}) : super(key: key);

  @override
  State<NickNameVege> createState() => _NickNameVegeState();
}

class _NickNameVegeState extends State<NickNameVege> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FarmusThemeData.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                hintText: '채소 별명 예시',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: const BorderSide(
                    color: FarmusThemeData.grey4,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
