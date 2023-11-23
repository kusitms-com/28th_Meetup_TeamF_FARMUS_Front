import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view/home/component/home_green_box_user.dart';

import '../../../model/my_vege_list.dart';
import '../component/diary/diary_screen.dart';

class SwipeScreen extends StatefulWidget {
  final MyVegeList? myVegeList;
  const SwipeScreen({Key? key, required this.myVegeList}) : super(key: key);

  @override
  _SwipeScreenState createState() => _SwipeScreenState();
}

class _SwipeScreenState extends State<SwipeScreen> {
  final PageController _pageController = PageController();
  // final List<String> _pageContents = ['Page 1', 'Page 2', 'Page 3'];
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FarmusThemeData.white,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: widget.myVegeList?.diaryPostList.length,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              itemBuilder: (context, index) {
                return GestureDetector(
                  // onTap: () {
                  //   Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) =>  DiaryScreen(
                  //         userNickName: widget.myVegeList?.userNickname,
                  //         id: widget.myVegeList?.diaryPostList[index].id,
                  //         nickname: widget.myVegeList?.diaryPostList[index].nickname,
                  //         image: widget.myVegeList?.diaryPostList[index].image,
                  //         age: widget.myVegeList?.diaryPostList[index].age,
                  //       ),
                  //     ),
                  //   );
                  // },
                  child: buildPageWidget(index),
                );
              },
            ),
          ),
          buildPageIndicator(),
        ],
      ),
    );
  }

  Widget buildPageWidget(index) {
    return HomeGreenBoxUser(
      userNickName: widget.myVegeList?.userNickname,
      vegeId: widget.myVegeList?.diaryPostList[index].id,
      nickname: widget.myVegeList?.diaryPostList[index].nickname,
      image: widget.myVegeList?.diaryPostList[index].image,
      age: widget.myVegeList?.diaryPostList[index].age,
      motivation: widget.myVegeList?.motivation,
    );
  }

  Widget buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        widget.myVegeList!.diaryPostList.length,
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
        color: _currentPage == index ? FarmusThemeData.dark : Colors.grey,
      ),
    );
  }
}
