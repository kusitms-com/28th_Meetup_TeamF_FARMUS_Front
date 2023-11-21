import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnboardSecond extends StatefulWidget {
  const OnboardSecond({Key? key}) : super(key: key);

  @override
  State<OnboardSecond> createState() => _OnboardSecondState();
}

class _OnboardSecondState extends State<OnboardSecond> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          color: const Color(0xffffffff),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 160),
              Center(
                child: Image.asset(
                  "assets/image/onboard_image.png",
                  width: 360,
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        color: const Color(0xffE2D2B4),
                        height: 330,
                        width: double.infinity,
                        child: const Padding(
                          padding: EdgeInsets.all(40.0),
                          child: Text(
                            '꾸준한 채소 기록을 통해\n홈파밍의 성취감을 느낄 수 있어요',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff7B5E44),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 323,
                      child: SvgPicture.asset(
                        "assets/image/second_plant.svg",
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
