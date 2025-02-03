import 'package:get/get.dart';

import '../../modules.dart';

class FavoritesController extends GetxController {
  RxList<DetailModel> favoriteBooks = <DetailModel>[].obs;

  void addToFavorites(DetailModel book) {
    if (!favoriteBooks.contains(book)) {
      favoriteBooks.add(book);
    }
  }

  void removeFromFavorites(DetailModel book) {
    favoriteBooks.remove(book);
  }

  bool isFavorite(DetailModel book) {
    return favoriteBooks.contains(book);
  }
}
