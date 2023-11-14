import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';

class Farmclub extends StatefulWidget {
  const Farmclub({super.key});

  @override
  State<Farmclub> createState() => _FarmclubState();
}

class _FarmclubState extends State<Farmclub> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: FarmusThemeData.grey4),
          )
        ],
      ),
    );
  }
}
