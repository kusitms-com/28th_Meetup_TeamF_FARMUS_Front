import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardFirst extends StatefulWidget {
  const OnboardFirst({Key? key}) : super(key: key);

  @override
  State<OnboardFirst> createState() => _OnboardFirstState();
}

class _OnboardFirstState extends State<OnboardFirst> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

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
                child: SvgPicture.asset(
                  "assets/image/missionbox.svg",
                  width: 340,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.only(left: (screenWidth - 350) / 2),
                child: SvgPicture.asset(
                  "assets/image/toggle_box.svg",
                  width: 180,
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
                            '내가 심은 채소를\n쉽고 편하게 관리할 수 있어요',
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
                      bottom: 329,
                      child: SvgPicture.asset(
                        "assets/image/first_plant.svg",
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
