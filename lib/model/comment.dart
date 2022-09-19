import 'package:intl/intl.dart';

class Comment {
  final int userId;
  final String userLogin;
  final int date;
  final String userImg;
  final String photo;
  final String description;

  Comment({
    required this.userId,
    required this.userLogin,
    required this.date,
    required this.userImg,
    required this.description,
    required this.photo,
  });

  String getFormattedDate() => DateFormat('dd.MM.yyyy')
      .format(DateTime.fromMillisecondsSinceEpoch(date));
}
