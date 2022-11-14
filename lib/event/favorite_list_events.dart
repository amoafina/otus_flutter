abstract class FavoriteListEvents {}

class GetFavoriteList extends FavoriteListEvents {
  final int userId;

  GetFavoriteList({required this.userId});
}
