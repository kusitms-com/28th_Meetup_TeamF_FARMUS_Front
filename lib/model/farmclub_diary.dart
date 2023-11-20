class FarmclubDiary {
  final int postId;
  final String profileImage;
  final String nickName;
  final String date;
  final String image;
  final String content;
  final int like;

  FarmclubDiary({
    required this.postId,
    required this.profileImage,
    required this.nickName,
    required this.date,
    required this.image,
    required this.content,
    required this.like,
  });

  factory FarmclubDiary.fromJson(Map<String, dynamic> json) {
    return FarmclubDiary(
      postId: json['postId'] as int,
      profileImage: json['profileImage'] as String,
      nickName: json['nickName'] as String,
      date: json['date'] as String,
      image: json['image'] as String,
      content: json['content'] as String,
      like: json['like'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'postId': postId,
      'profileImage': profileImage,
      'nickName': nickName,
      'date': date,
      'image': image,
      'content': content,
      'like': like,
    };
  }
}
