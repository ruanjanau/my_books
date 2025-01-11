import 'package:dio/dio.dart';

class BookDio {
  Dio dioClient = Dio();
  final baseUrl = 'https://www.googleapis.com/books/v1/volumes';

  static final BookDio _instance = BookDio._internal();

  factory BookDio() {
    _instance.dioClient.interceptors.add(getInterceptor());
    return _instance;
  }

  BookDio._internal();

  Dio get dio => dioClient;

  static InterceptorsWrapper getInterceptor() {
    return InterceptorsWrapper(
      onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
        return handler.next(options);
      },
      onResponse: (Response response, ResponseInterceptorHandler handler) {
        return handler.next(response);
      },
      onError: (DioException error, ErrorInterceptorHandler handler) {
        return handler.next(error);
      },
    );
  }
}
