class WholePosting {
  final int userId;
  final String title;
  final String contents;
  final List<String> postingImage;
  final int postingId;
  final String tag;
  final String createdAt;
  final int commentCount;
  final String nickName;
  final String userImageUrl;

  WholePosting({
    required this.userId,
    required this.title,
    required this.contents,
    required this.postingImage,
    required this.postingId,
    required this.tag,
    required this.createdAt,
    required this.commentCount,
    required this.nickName,
    required this.userImageUrl,
  });

  factory WholePosting.fromJson(Map<String, dynamic> json) {
    return WholePosting(
      userId: json['userId'],
      title: json['title'],
      contents: json['contents'],
      postingImage: List<String>.from(json['postingImage']),
      postingId: json['postingId'],
      tag: json['tag'],
      createdAt: json['created_at'],
      commentCount: json['commentCount'],
      nickName: json['nickName'],
      userImageUrl: json['userImageUrl'],
    );
  }
}
