import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnboardThird extends StatefulWidget {
  const OnboardThird({Key? key}) : super(key: key);

  @override
  State<OnboardThird> createState() => _OnboardThirdState();
}

class _OnboardThirdState extends State<OnboardThird> {
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
              Align(
                alignment: Alignment.centerRight,
                child: Image.asset(
                  "assets/image/onboard3.png",
                  width: 380,
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
                            '같은 채소를 키우는 사람들과\n동기부여하며 열정을 유지할 수 있어요',
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
                        "assets/image/third_plant.svg",
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
