import 'package:my_books/src/core/network/book_dio.dart';

import '../details.dart';

class DetailRepository {
  final BookDio bookDio = BookDio();

  Future<DetailModel> getDetail(String id) async {
    final response = await bookDio.dio.get(
      '${bookDio.baseUrl}/$id',
    );

    return DetailModel.fromJson(response.data);
  }
}
