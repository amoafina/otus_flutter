import 'package:otusfood/api/food_api.dart';

abstract class BaseRepository<B> {
  final FoodApi foodApi;
  final B baseBox;

  BaseRepository({
    required FoodApi foodApi,
    required B baseBox,
  })  : foodApi = foodApi,
        baseBox = baseBox;
}
