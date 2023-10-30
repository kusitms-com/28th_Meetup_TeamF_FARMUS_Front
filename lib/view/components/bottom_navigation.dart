import 'package:flutter/material.dart';

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
            child: Image.asset(
              'assets/icons/ic_home.png',
              width: 32,
              height: 32,
            ),
          ),
          activeIcon: Container(
            child: Image.asset(
              'assets/icons/ic_home.svg',
              width: 32,
              height: 32,
            ),
          ),
          label: "홈",
        ),
        BottomNavigationBarItem(
          icon: Container(
              child: Image.asset(
            'assets/icons/ic_home.png',
            height: 20,
            width: 23,
          )),
          activeIcon: Container(
              child: Image.asset(
            'assets/icons/ic_home.png',
            height: 20,
            width: 23,
          )),
          backgroundColor: Colors.white,
          label: "챌린지",
        ),
        BottomNavigationBarItem(
          icon: Container(
              child: Image.asset(
            'assets/icons/ic_home.png',
            height: 20,
            width: 23,
          )),
          activeIcon: Icon(Icons.person),
          backgroundColor: Colors.white,
          label: "커뮤니티",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          activeIcon: Icon(Icons.person),
          backgroundColor: Colors.white,
          label: "마이페이지",
        ),
      ],
    );
  }
}
