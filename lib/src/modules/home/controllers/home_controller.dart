import 'package:get/get.dart';
import 'package:my_books/src/modules/home/models/book_model.dart';

import '../repositories/home_repository.dart';

class HomeController extends GetxController {
  final HomeRepository homeRepository = HomeRepository();
  RxBool isLoading = false.obs;

  RxList<BookModel> books = <BookModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    searchBooks('');
  }

  void refreshBooks() {
    searchBooks('');
  }

  Future<void> searchBooks(String search) async {
    isLoading.value = true;
    final books = await homeRepository.searchBooks(search);
    this.books.value = books;
    isLoading.value = false;
  }
}
