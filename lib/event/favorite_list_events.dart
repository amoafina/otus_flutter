abstract class FavoriteListEvents {}

class RequestedFavorites extends FavoriteListEvents {
  final int userId;

  RequestedFavorites({required this.userId});
}
