import 'package:flutter/material.dart';
import 'package:mojacknong_android/view/farmclub/BottomSheetFinal/farmclub_finish_bottom_sheet.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          constraints: const BoxConstraints(maxHeight: 700),
          child: const BottomSheetFarmClubClear(
            imagePath: 'assets/image/lettuce1.svg',
            textContent:
                '텃밭부터 식탁까지 이어진 nn일의\n팜클럽 기간동안 n번 미션 인증을 했고\nn번 성장일기를 기록했어요\n\n앞으로의 홈파밍 여정도 팜어스와 함께해요!',
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("팜클럽 완료 바텀시트"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _showBottomSheet(context),
          child: const Text('팜클럽'),
        ),
      ),
    );
  }
}
