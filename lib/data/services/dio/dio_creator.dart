import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:marveldex/data/services/dio/dio_interceptors.dart';

class DioCreator {
  // Singleton
  static final DioCreator _instance = DioCreator._internal();

  static DioCreator get instance => _instance;

  DioCreator._internal();

  /// Instância Dio com configurações padrões e chaves para Marvel API
  Dio generateMarvelUrl() {
    final String baseURL = String.fromEnvironment('BASE_URL');
    final String publicKey = String.fromEnvironment('PUBLIC_KEY');
    final String privateKey = String.fromEnvironment('PRIVATE_KEY');

    final ts = DateTime.now().millisecondsSinceEpoch;
    final hash =
        md5.convert(utf8.encode('$ts$privateKey$publicKey')).toString();

    final Map<String, dynamic> queryParameters = {
      'ts': ts,
      'apikey': publicKey,
      'hash': hash,
    };

    Dio dio = Dio();
    dio.options.baseUrl = baseURL;
    dio.options.queryParameters = queryParameters;
    dio.options.contentType = Headers.jsonContentType;
    dio.interceptors.add(DioInterceptors());

    return dio;
  }
}
