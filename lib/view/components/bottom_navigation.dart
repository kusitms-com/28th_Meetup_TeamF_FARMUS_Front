import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SampleScreen extends StatefulWidget {
  const SampleScreen({Key? key}) : super(key: key);

  @override
  State<SampleScreen> createState() => _SampleScreenState();
}

class _SampleScreenState extends State<SampleScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(),
        body: Column(),
        bottomNavigationBar: _bottom(),
      ),
    );
  }

  int selectedIndex = 0;
  final String assetName = 'assets/icons/ic_home.svg';

  Widget _bottom() {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: (value) {
        setState(() {
          selectedIndex = value;
        });
      },
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedItemColor: Color(0xFF184B2D),
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: Container(
              child: SvgPicture.asset(
            'assets/icons/ic_home.svg',
          )),
          label: "홈",
        ),
        BottomNavigationBarItem(
          icon: Container(
              child: SvgPicture.asset(
            'assets/icons/ic_challenge.svg',
          )),
          activeIcon: Container(
              child: SvgPicture.asset(
            'assets/icons/ic_challenge.svg',
          )),
          backgroundColor: Colors.white,
          label: "챌린지",
        ),
        BottomNavigationBarItem(
          icon: Container(
              child: SvgPicture.asset(
            'assets/icons/ic_community.svg',
          )),
          activeIcon: Container(
              child: SvgPicture.asset(
            'assets/icons/ic_community.svg',
          )),
          backgroundColor: Colors.white,
          label: "커뮤니티",
        ),
        BottomNavigationBarItem(
          icon: Container(
              child: SvgPicture.asset(
            'assets/icons/ic_mypage.svg',
          )),
          activeIcon: Container(
              child: SvgPicture.asset(
            'assets/icons/ic_mypage.svg',
          )),
          backgroundColor: Colors.white,
          label: "마이페이지",
        ),
      ],
    );
  }
}
