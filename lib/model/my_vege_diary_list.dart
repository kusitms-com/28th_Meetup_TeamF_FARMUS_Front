import 'my_vege_diary_dto.dart';

class MyVegeDiaryList {
  final List<MyVegeDiaryDto> diaryPostList;

  MyVegeDiaryList({
    List<MyVegeDiaryDto>? diaryPostList,
  }) : diaryPostList = diaryPostList ?? [];

  factory MyVegeDiaryList.fromJson(List<dynamic> jsonList) {
    final routines = jsonList
        .map((vege) => MyVegeDiaryDto.fromJson(vege))
        .toList();

    return MyVegeDiaryList(diaryPostList: routines);
  }
}