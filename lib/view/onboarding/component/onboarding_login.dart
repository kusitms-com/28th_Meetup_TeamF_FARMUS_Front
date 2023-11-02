import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnboardingLogin extends StatelessWidget {
  final String title;
  final String? description;

  const OnboardingLogin({
    Key? key,
    required this.title,
    this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontFamily: "Pretendard"),
            textAlign: TextAlign.start,
          ),
          SizedBox(
            height: 30,
          ),
          SvgPicture.asset("assets/image/ic_onboarding_profile.svg"),
        ],
      ),
    );
  }
}
