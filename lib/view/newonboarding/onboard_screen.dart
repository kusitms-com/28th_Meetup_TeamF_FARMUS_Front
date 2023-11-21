import 'package:flutter/material.dart';
import 'package:mojacknong_android/view/newonboarding/onboard_first.dart';
import 'package:mojacknong_android/view/newonboarding/onboard_second.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();
  final List<String> _pageContents = ['Page 1', 'Page 2', 'Page 3', 'Page 4'];
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: _pageContents.length,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemBuilder: (context, index) {
              if (index == 0) {
                return const OnboardFirst();
              } else if (index == 1) {
                return const OnboardSecond();
              } else if (index == 2) {
                return const OnboardFirst();
              } else if (index == 3) {
                return const OnboardFirst();
              } else {
                return Container();
              }
            },
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 220,
            child: buildPageIndicator(),
          ),
        ],
      ),
    );
  }

  Widget buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        _pageContents.length,
        (index) => buildIndicator(index),
      ),
    );
  }

  Widget buildIndicator(int index) {
    return Container(
      width: 6.0,
      height: 6.0,
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _currentPage == index
            ? const Color(0x7e000000)
            : const Color(0x33000000),
      ),
    );
  }
}
