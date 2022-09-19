class FoodStep {
  String description;
  int id;
  int timeSec;
  int foodId;
  int stepNumber;
  bool isSuccess;

  FoodStep({
    required this.description,
    required this.id,
    required this.foodId,
    required this.timeSec,
    required this.stepNumber,
    required this.isSuccess,
  });

  getTimeMinute() {
    int minute = timeSec ~/ 60;
    int sec = timeSec % 60;
    String txtMinute = minute < 10 ? "0$minute" : minute.toString();
    String txtSec = sec < 10 ? "0$sec" : sec.toString();
    return "$txtMinute:$txtSec";
  }
}
