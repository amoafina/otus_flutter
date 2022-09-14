class Food {
  final String title;
  final int time;
  final int id;
  final String imgLocalSource;

  Food(this.title, this.time, this.id, this.imgLocalSource);

  String getTimeValue() => "$time минут";

  String getLocalPath() => "assets/images/$imgLocalSource";
}
