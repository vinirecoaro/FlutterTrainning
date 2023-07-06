import 'package:dio/dio.dart';

class JsonPlaceHolderDio {
  final _dio = Dio();

  Dio get dio => _dio;

  JsonPlaceHolderDio() {
    _dio.options.baseUrl = "https://jsonplaceholder.typicode.com";
  }
}
