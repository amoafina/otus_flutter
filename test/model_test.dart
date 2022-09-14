import 'package:otusfood/model/food.dart';
import 'package:test/test.dart';

void main() {
  group('Food model', () {
    test('Time > 60 min (75 min)', () {
      final Food result = Food(title: "75 min", time: 75, id: 1, imgLocalSource: "");
      expect(result.getTimeValue(), equals("1 час 15 минут"));
    }, skip: false);
    test('Time < 60 min (31 min)', () {
      final Food result = Food(title: "31 min", time: 31, id: 1, imgLocalSource: "");
      expect(result.getTimeValue(), equals("31 минута"));
    }, skip: false);
    test('Time > 60 min (452 min)', () {
      final Food result = Food(title: "452 min", time: 452, id: 1, imgLocalSource: "");
      expect(result.getTimeValue(), equals("7 часов 32 минуты"));
    }, skip: false);
  });
}
