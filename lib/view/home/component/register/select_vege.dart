import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view/home/component/register/customs/select_image_widget.dart';

class RegisterVege extends StatefulWidget {
  const RegisterVege({Key? key}) : super(key: key);

  @override
  State<RegisterVege> createState() => _RegisterVegeState();
}

class _RegisterVegeState extends State<RegisterVege> {
  List<bool> isSelectedList = List.generate(6, (index) => false);

  void _onImageTap(int index) {
    setState(() {
      isSelectedList[index] = !isSelectedList[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    const List<String> blackPaths = [
      'assets/image/lettuce_black.svg',
      'assets/image/greenonion_black.svg',
      'assets/image/basil_black.svg',
      'assets/image/sesame_black.svg',
      'assets/image/pepper_black.svg',
      'assets/image/tomato_black.svg',
    ];

    const List<String> colPaths = [
      'assets/image/lettuce_col.svg',
      'assets/image/greenonion_col.svg',
      'assets/image/basil_col.svg',
      'assets/image/sesame_col.svg',
      'assets/image/pepper_col.svg',
      'assets/image/tomato_col.svg',
    ];

    const List<String> veggieNames = [
      '상추',
      '대파',
      '바질',
      '깻잎',
      '고추',
      '토마토',
    ];

    const List<String> difficulties = [
      'Easy',
      'Easy',
      'Normal',
      'Normal',
      'Hard',
      'Hard',
    ];

    return Scaffold(
      backgroundColor: FarmusThemeData.white,
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 6.0,
          mainAxisSpacing: 12.0,
        ),
        itemCount: 6,
        itemBuilder: (BuildContext context, int index) {
          return ImageWidget(
            blackPath: blackPaths[index],
            colPath: colPaths[index],
            isSelected: isSelectedList[index],
            onTap: () => _onImageTap(index),
            veggieName: veggieNames[index],
            difficulty: difficulties[index],
          );
        },
      ),
    );
  }
}
