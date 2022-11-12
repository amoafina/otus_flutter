import '../model/comment.dart';

abstract class CommentsState {}

class ShowCommentsList extends CommentsState {
  final List<Comment> comments;

  ShowCommentsList({required this.comments});
}

class ShowEmptyList extends CommentsState {}

class Init extends CommentsState {}
