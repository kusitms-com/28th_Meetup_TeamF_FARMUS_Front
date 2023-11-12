class PostingComment {
  final int userId;
  final int postingId;
  final int commentCount;
  final String createdAt;
  final String commentContents;
  final String nickName;
  final String? userImageUrl;

  PostingComment({
    required this.userId,
    required this.postingId,
    required this.commentCount,
    required this.createdAt,
    required this.commentContents,
    required this.nickName,
    this.userImageUrl,
  });

  factory PostingComment.fromJson(Map<String, dynamic> json) {
    return PostingComment(
      userId: json['userId'],
      postingId: json['postingId'],
      commentCount: json['commentCount'],
      createdAt: json['created_at'],
      commentContents: json['commentContents'],
      nickName: json['nickName'] ?? "",
      userImageUrl: json['userImageUrl'],
    );
  }
}
