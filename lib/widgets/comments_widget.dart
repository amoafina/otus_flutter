import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:otusfood/bloc/comments_bloc.dart';
import 'package:otusfood/event/comments_event.dart';
import 'package:otusfood/model/comment.dart';
import 'package:otusfood/state/comments_state.dart';
import 'package:otusfood/utils/app_colors.dart';
import 'package:otusfood/utils/utils.dart';

class CommentsWidget extends StatefulWidget {
  final int recipeId;

  CommentsWidget({
    required this.recipeId,
  });

  @override
  _CommentsWidgetState createState() => _CommentsWidgetState();
}

class _CommentsWidgetState extends State<CommentsWidget> {
  late CommentsBloc commentsBloc;

  @override
  void initState() {
    commentsBloc = context.read<CommentsBloc>();
    commentsBloc.add(GetCommentsForRecipe(
      recipeId: widget.recipeId,
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Divider(
          color: AppColors.border,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Container(
            child: BlocBuilder<CommentsBloc, CommentsState>(
              builder: (builder, state) {
                if (state is ShowCommentsList) {
                  return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: state.comments.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                          child: _ItemCommentWidget(
                            comment: state.comments[index],
                          ),
                        );
                      });
                } else {
                  return Container();
                }
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 48.0,
          ),
          child: _AddingCommentWidget(
              commentBloc: commentsBloc,
              addingComment: (text, photoPath) => _addComment(text, photoPath),

          ),
        ),
      ],
    );
  }

  void _addComment(String text, String photoPath) {
    commentsBloc.add(AddCommentToRecipe(
      text: text,
      photoPath: photoPath,
      recipeId: widget.recipeId,
    ));
  }
}

class _AddingCommentWidget extends StatefulWidget {
  final Function addingComment;
  final CommentsBloc commentBloc;

  _AddingCommentWidget({
    required this.addingComment,
    required this.commentBloc,
  });

  @override
  _AddingCommentWidgetState createState() => _AddingCommentWidgetState();
}

class _AddingCommentWidgetState extends State<_AddingCommentWidget> {
  String? photoPath = null;
  TextEditingController _controller = TextEditingController();
  final ImagePicker _imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Visibility(
          child: photoPath != null
              ? Image.file(
            File(photoPath!),
            width: double.infinity,
            height: 160.0,
          )
              : Container(),
          visible: photoPath != null,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Stack(
            children: [
              TextFormField(
                maxLines: 3,
                controller: _controller,
                onFieldSubmitted: (txt) {
                  setState(() {
                    widget.addingComment(txt, photoPath ?? "");
                    photoPath = null;
                    _controller.clear();
                  });
                },
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.main,
                      width: 2.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.main,
                      width: 2.0,
                    ),
                  ),
                  hintText: 'оставить комментарий',
                ),
              ),
              Align(
                child: IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (builder) =>
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextButton(
                                onPressed: () => _pickImage(ImageSource.camera),
                                child: Container(
                                  width: double.infinity,
                                  child: Center(
                                    child: Text(
                                      'Сфотографировать',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Divider(
                                height: 1.0,
                                color: Colors.grey[350],
                              ),
                              TextButton(
                                onPressed: () =>
                                    _pickImage(ImageSource.gallery),
                                child: Container(
                                  width: double.infinity,
                                  child: Center(
                                    child: Text(
                                      'Выбрать из альбома',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Divider(
                                height: 1.0,
                                color: Colors.grey[350],
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  width: double.infinity,
                                  child: Center(
                                    child: Text(
                                      'Отмена',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                    );
                  },
                  icon: Icon(
                    Icons.image_rounded,
                    color: AppColors.main,
                  ),
                ),
                alignment: Alignment.topRight,
              )
            ],
          ),
        ),
      ],
    );
  }

  _pickImage(ImageSource imageSource) async {
    final XFile? image = await _imagePicker.pickImage(source: imageSource);
    Navigator.pop(context);
    print('image: ${image?.path}');
    setState(() {
      photoPath = image?.path;
    });
  }
}

class _ItemCommentWidget extends StatelessWidget {
  final Comment comment;

  _ItemCommentWidget({
    required this.comment,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: AppColors.main,
            backgroundImage: NetworkImage(
              'https://freepngimg.com/thumb/face/97737-grumpy-face-cat-free-png-hq.png',
            ),
            radius: 31.0,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "login", // TODO: user login
                        style: TextStyle(
                          color: AppColors.mainAccent,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        dateTimeFormatForRead(comment.datetime),
                        style: TextStyle(
                          color: AppColors.inactive,
                          fontWeight: FontWeight.w400,
                          fontSize: 14.0,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 12.0,
                    ),
                    child: Text(
                      comment.text,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: comment.photo.isEmpty
                        ? Container()
                        : Image.file(File(comment.photo)),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
