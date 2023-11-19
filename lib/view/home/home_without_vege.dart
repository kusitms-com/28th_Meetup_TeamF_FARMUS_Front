import 'package:flutter/material.dart';

class HomeWithoutVege extends StatelessWidget {
  const HomeWithoutVege({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        '\n\n아직 루틴을 등록하지 않았어요\n루틴을 등록해 내 채소를 건강하게 관리하세요!',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 13, fontFamily: 'Pretendard'),
      ),
    );
  }
}
