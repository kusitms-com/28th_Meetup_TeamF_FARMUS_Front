import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import '../../../../view_model/controllers/vege_controller.dart';

class NickNameVege extends StatefulWidget {

  const NickNameVege({Key? key}) : super(key: key);


  @override
  State<NickNameVege> createState() => _NickNameVegeState();
}

class _NickNameVegeState extends State<NickNameVege> {
  final VegeController vegeController = Get.find();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FarmusThemeData.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            GetBuilder<VegeController>(
              builder: (controller) {
                return TextField(

                  onChanged: (value) {
                    controller.updateNicknameValue(value);
                  },
                  decoration: InputDecoration(
                    hintText: '채소',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: const BorderSide(
                        color: FarmusThemeData.grey4,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}