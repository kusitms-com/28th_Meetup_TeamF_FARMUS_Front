import 'package:mojacknong_android/model/posting_comment.dart';
import 'package:mojacknong_android/model/whole_posting.dart';

class CommunityDetail {
  final WholePosting wholePostingDto;
  final List<PostingComment?> postingCommentList;

  CommunityDetail({
    required this.wholePostingDto,
    List<PostingComment?>? postingCommentList,
  }) : postingCommentList = postingCommentList ?? [];

  factory CommunityDetail.fromJson(Map<String, dynamic> json) {
    return CommunityDetail(
      wholePostingDto: WholePosting.fromJson(json['wholePostingDto']),
      postingCommentList: (json['postingCommentList'] != null)
          ? List<PostingComment>.from(
              json['postingCommentList'].map(
                (x) => PostingComment.fromJson(x),
              ),
            )
          : [],
    );
  }
}
