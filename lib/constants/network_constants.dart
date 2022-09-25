import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class CustomDioClient {
  Dio init() {
    Dio _dio = Dio();

    _dio.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) async {
      // SETTING BASE URL
      String baseUrl = "https://pro-api.coinmarketcap.com";
      options.baseUrl = baseUrl;

      //SETTING HEADERS
      String proApiKey = dotenv.env['X-CMC_PRO_API_KEY'] ?? '';
      Map<String, dynamic> defaultHeaders = {"X-CMC_PRO_API_KEY": proApiKey};
      options.headers.addAll(defaultHeaders);

      return handler.next(options);
    }, onResponse: (response, handler) {
      // Do something with response data
      return handler.next(response); // continue
    }, onError: (DioError error, handler) async {
      return handler.next(error); //continue
    }));
    return _dio;
  }
}

Dio dioClient = CustomDioClient().init();
