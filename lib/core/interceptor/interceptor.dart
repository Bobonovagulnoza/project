import 'package:dio/dio.dart';

class DioClient {
  final Dio dioClient =
  Dio(
    BaseOptions(
      baseUrl: 'https://api.elaro.uz/api',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      contentType: 'application/json',
    ),
  )
    ..interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          print('REQUEST[${options.method}] => PATH: ${options.path}');
          print('Headers: ${options.headers}');
          print('Data: ${options.data}');
          return handler.next(options);
        },
        onResponse: (response, handler) {
          print(
            'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}',
          );
          print('Data: ${response.data}');
          return handler.next(response);
        },
        onError: (DioException error, handler) {
          print(
            'ERROR[${error.response?.statusCode}] => PATH: ${error.requestOptions.path}',
          );
          print('Message: ${error.message}');
          print('Response: ${error.response?.data}');
          return handler.next(error);
        },
      ),
    );
}
