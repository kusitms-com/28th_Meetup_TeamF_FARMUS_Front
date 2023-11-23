import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/model/routine_check_dto.dart';
import 'package:mojacknong_android/view/home/component/mission_routine/custom_switch.dart';
import 'package:mojacknong_android/view/home/component/mission_routine/cycle_appbar.dart';
import 'package:mojacknong_android/view/home/component/mission_routine/cycle_number.dart';
import 'package:mojacknong_android/view/home/component/mission_routine/mission_routine_controller.dart';

class CycleSetting extends StatefulWidget {
  final int routineId;
  final int period;
  final String text;

  CycleSetting({
    Key? key,
    required this.routineId,
    required this.period,
    required this.text,
  }) : super(key: key);

  @override
  State<CycleSetting> createState() => _CycleSettingState();
}

class _CycleSettingState extends State<CycleSetting> {
  MissionRoutineController controller = Get.find();
  String routine = "";
  late TextEditingController _controller;
  RxBool isSwitched = false.obs;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.period.toString());
    isSwitched.value = widget.period != 0;
    routine = widget.text;
    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CycleAppBar(
        title: "주기 설정",
        onPressed: () {
          controller.updateRoutine(widget.routineId,
              isSwitched.value ? int.parse(_controller.value.text) : 0);
        },
      ),
      backgroundColor: FarmusThemeData.white,
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(height: 75),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(routine,
              style:
                  const TextStyle(fontSize: 17, fontWeight: FontWeight.w600)),
        ),
        const SizedBox(height: 24),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Stack(
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
                  Center(
                    child: isLoading
                        ? const CircularProgressIndicator(
                            color: FarmusThemeData.brown)
                        : CustomSwitch(
                            value: isSwitched.value,
                            onChanged: (value) {
                              setState(() {
                                isSwitched.value = value;
                              });
                            },
                          ),
                  ),
                  const SizedBox(width: 20),
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
