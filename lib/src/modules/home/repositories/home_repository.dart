import 'package:my_books/src/core/network/book_dio.dart';
import 'package:my_books/src/modules/home/models/book_model.dart';

class HomeRepository {
  final BookDio bookDio = BookDio();

  Future<List<BookModel>> searchBooks(String search) async {
    final response = await bookDio.dio.get(
      bookDio.baseUrl,
      queryParameters: {'q': search.isEmpty ? 'bestsellers' : search},
    );
    final books = response.data['items'] as List<dynamic>;
    return books.map((e) => BookModel.fromJson(e)).toList();
  }
}
