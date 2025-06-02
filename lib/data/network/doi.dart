import 'package:dio/dio.dart';

class DioClient {
  final Dio dio = Dio()
    ..interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          print("Request started");
          return handler.next(options);
        },
        onResponse: (response, handler) {
          print("Response received");
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          print("Error occurred: ${e.message}");
          return handler.next(e);
        },
      ),
    );
}
