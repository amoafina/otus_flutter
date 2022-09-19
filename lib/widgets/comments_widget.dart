import 'package:flutter/material.dart';
import 'package:otusfood/model/comment.dart';
import 'package:otusfood/model/food.dart';
import 'package:otusfood/utils/app_colors.dart';

class CommentsWidget extends StatefulWidget {
  final Food food;

  CommentsWidget({
    required this.food,
  });

  @override
  _CommentsWidgetState createState() => _CommentsWidgetState();
}

class _CommentsWidgetState extends State<CommentsWidget> {
  TextEditingController _controller = TextEditingController();

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
          child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: widget.food.comments.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: _ItemCommentWidget(
                    comment: widget.food.comments[index],
                  ),
                );
              }),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 48.0,
          ),
          child: Stack(
            children: [
              TextFormField(
                maxLines: 3,
                controller: _controller,
                onFieldSubmitted: (txt) {
                  setState(() {
                    _addComment(txt);
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
                  onPressed: () {},
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

  int _getCurrentDate() => DateTime.now().millisecondsSinceEpoch;

  void _addComment(String description) {
    Comment comment = Comment(
        userId: 1,
        userLogin: 'user_login',
        date: _getCurrentDate(),
        userImg: "",
        description: description,
        photo: "");
    widget.food.comments.add(comment);
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
                        comment.userLogin,
                        style: TextStyle(
                          color: AppColors.mainAccent,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        comment.getFormattedDate(),
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
                      comment.description,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Image.network(
                      'https://freepngimg.com/thumb/face/97737-grumpy-face-cat-free-png-hq.png',
                    ),
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
