import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otusfood/event/comments_event.dart';
import 'package:otusfood/model/entity_link.dart';
import 'package:otusfood/model/result_operation.dart';
import 'package:otusfood/model/success_operation.dart';
import 'package:otusfood/model/user.dart';
import 'package:otusfood/presenters/user_presenter.dart';
import 'package:otusfood/repositories/comments_repository.dart';
import 'package:otusfood/state/comments_state.dart';

import '../model/comment.dart';

class CommentsBloc extends Bloc<CommentsEvent, CommentsState> {
  CommentsBloc({
    required this.userPresenter,
    required this.commentsRepository,
  }) : super(Init()) {
    on<GetCommentsForRecipe>((event, emit) async {
      List<Comment> comments =
          await commentsRepository.getCommentForRecipe(event.recipeId);
      emit(
        comments.isEmpty
            ? ShowEmptyList()
            : ShowCommentsList(
                comments: comments,
              ),
      );
    });
    on<AddCommentToRecipe>((event, emit) async {
      User? user = userPresenter.currentUser;
      Comment comment = new Comment(
          id: 0,
          text: event.text,
          photo: event.photoPath ?? "",
          datetime: _getCurrentDate(),
          user: new EntityLink(
            id: 1,
          ),
          recipe: new EntityLink(
            id: event.recipeId,
          ));

      ResultOperation resultOperation =
          await commentsRepository.addComment(comment);

      if (resultOperation is SuccessOperation) {
        emit(
          ShowCommentsList(comments: resultOperation.object as List<Comment>),
        );
      }
    });
  }

  String _getCurrentDate() => DateTime.now().toIso8601String();

  final UserPresenter userPresenter;
  final CommentsRepository commentsRepository;
}
