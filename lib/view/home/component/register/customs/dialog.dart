import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RegisterDialogWidget extends StatefulWidget {
  const RegisterDialogWidget({Key? key}) : super(key: key);

  @override
  _RegisterDialogWidgetState createState() => _RegisterDialogWidgetState();
}

class _RegisterDialogWidgetState extends State<RegisterDialogWidget> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 2), () {
      if (mounted) {
        Navigator.pop(context);
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      content: FractionallySizedBox(
        widthFactor: 0.8,
        heightFactor: 0.26,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const SizedBox(height: 20),
            SvgPicture.asset(
              'assets/image/lettuce_col.svg',
              height: 110,
            ),
            const SizedBox(height: 8),
            const Text(
              "상훈이",
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(width: 30),
                SvgPicture.asset('assets/image/ic_check.svg'),
                const SizedBox(width: 8),
                const Text(
                  "채소가 등록되었어요",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(width: 30),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class RegisterDialog {
  static void flutterDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return const RegisterDialogWidget();
      },
    );
  }
}
