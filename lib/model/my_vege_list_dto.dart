
class MyVegeListDto{

  final int? id;
  final String? nickname;
  final String? image;
  final int? age;


  MyVegeListDto({
    required this.id,
    required this.nickname,
    required this.image,
    required this.age,
  });

  factory MyVegeListDto.fromJson(Map<String, dynamic> json) {
    return MyVegeListDto(
      id: json['id'],
      nickname: json['nickname'],
      image: json['image'],
      age: json['age'],


    );
  }
}
