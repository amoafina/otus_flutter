import 'package:otusfood/model/comment.dart';
import 'package:otusfood/model/food_ingredient.dart';
import 'package:otusfood/model/food_step.dart';

class Food {
  String title;
  int time;
  int id;
  String imgLocalSource;
  List<FoodStep> steps;
  List<FoodIngredient> ingredients;
  List<Comment> comments = [];

  bool isFavorite = false;

  Food({
    required this.title,
    required this.time,
    required this.id,
    required this.imgLocalSource,
    required this.steps,
    required this.ingredients,
  });

  String getTimeValue() {
    if (time >= 60) {
      int hours = Duration(minutes: time).inHours;
      int minutes = time - Duration(hours: hours).inMinutes;
      if (hours < 21) {
        String str = "$hours ${_formatHours(hours)}";
        if (minutes > 0) {
          str += " $minutes ${_formatMinutes(minutes)}";
        }
        return str;
      } else {
        return "Более 20 часов";
      }
    }
    return "$time ${_formatMinutes(time)}";
  }

  String getLocalPath() => "assets/images/$imgLocalSource";

  String _formatHours(int hours) {
    if (hours == 1) {
      return "час";
    } else if (hours > 1 && hours < 5) {
      return "часа";
    } else {
      return "часов";
    }
  }

  String _formatMinutes(int minutes) {
    int remainder = minutes % 10;
    if (remainder == 1) {
      return "минута";
    } else if (remainder > 1 && remainder < 5) {
      return "минуты";
    } else {
      return "минут";
    }
  }

  void addComment(Comment comment) {
    comments.add(comment);
  }
}
