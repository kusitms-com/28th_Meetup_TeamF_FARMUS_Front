import 'my_vege_list_dto.dart';

class MyVegeList {
  final List<MyVegeListDto> diaryPostList;
  final String? userNickname;
  final String? level;
  final String? motivation;

  MyVegeList({
    List<MyVegeListDto>? diaryPostList,
    required this.userNickname,
    required this.level,
    required this.motivation,
  }) : diaryPostList = diaryPostList ?? [];

  factory MyVegeList.fromJson(Map<String, dynamic> json) {
    return MyVegeList(
      diaryPostList: (json['veggieList'] != null)
          ? List<MyVegeListDto>.from(
              json['veggieList'].map(
                (x) => MyVegeListDto.fromJson(x),
              ),
            )
          : [],
      userNickname: json['userNickname'],
      level: json["level"],
      motivation: json["motivation"],
    );
  }
}
