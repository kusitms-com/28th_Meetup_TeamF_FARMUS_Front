import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/common/primary_app_bar.dart';
import 'package:mojacknong_android/view/farmclub/component/new_vegetable_select.dart';

class FarmclubMakeScreen extends StatefulWidget {
  const FarmclubMakeScreen({super.key});

  @override
  State<FarmclubMakeScreen> createState() => _FarmclubMakeScreenState();
}

class _FarmclubMakeScreenState extends State<FarmclubMakeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(title: "팜클럽 개설"),
      backgroundColor: FarmusThemeData.white,
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "함께 재배할 채소를 선택해주세요",
              style: FarmusThemeData.darkStyle14,
            ),
            SizedBox(
              height: 16,
            ),
            NewVegetableSelect(),
            Text("data")
          ],
        ),
      )),
    );
  }
}
