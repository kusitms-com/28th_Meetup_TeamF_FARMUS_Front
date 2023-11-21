import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardSecond extends StatefulWidget {
  const OnboardSecond({Key? key}) : super(key: key);

  @override
  State<OnboardSecond> createState() => _OnboardSecondState();
}

class _OnboardSecondState extends State<OnboardSecond> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Expanded(
          child: SvgPicture.asset(
            'assets/image/splash4.svg',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
