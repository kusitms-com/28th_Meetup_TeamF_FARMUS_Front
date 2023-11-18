import 'package:flutter/material.dart';
import 'package:mojacknong_android/view/home/component/mission_routine/custom_switch.dart';

class CycleNumber extends StatefulWidget {
  const CycleNumber({super.key});

  @override
  _CycleNumberState createState() => _CycleNumberState();
}

class _CycleNumberState extends State<CycleNumber> {
  final TextEditingController _controller = TextEditingController(text: '3');
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: double.infinity,
          height: 78,
          decoration: BoxDecoration(
            color: const Color(0xFFF7F7F7),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(width: 16),
            Container(
              width: 48,
              height: 48,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                controller: _controller,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                ),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(width: 8),
            const Text(
              '일에 한 번',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
            ),
            const Spacer(flex: 3),
            CustomSwitch(
              value: isSwitched,
              onChanged: (value) {
                setState(() {
                  isSwitched = value;
                });
              },
            ),
            const SizedBox(width: 20),
          ],
        ),
      ],
    );
  }
}
