import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:marveldex/data/services/dio/dio_interceptors.dart';

class DioManager {
  // Singleton
  late final Dio dio;

  static final DioManager _instance = DioManager._internal();
  static DioManager get instance => _instance;

  DioManager._internal() {
    dio = Dio();
    _setup();
  }

  void _setup() {
    final baseURL = dotenv.env['BASE_URL']!;
    dio.options.baseUrl = baseURL;
    dio.options.contentType = Headers.jsonContentType;
    dio.interceptors.add(DioInterceptors());
  }

  /// Parâmetros de autenticação para Marvel API
  String _queryParameters() {
    final publicKey = dotenv.env['PUBLIC_KEY'];
    final privateKey = dotenv.env['PRIVATE_KEY'];

    final ts = DateTime.now().millisecondsSinceEpoch;
    final hash =
        md5.convert(utf8.encode('$ts$privateKey$publicKey')).toString();

    return 'ts=$ts&apikey=$publicKey&hash=$hash';
  }

  /// GET method com headers dinâmicos
  Future<Response> get(String path, {Map<String, dynamic>? headers}) async {
    return dio.get(
      '$path&${_queryParameters()}',
      options: Options(headers: headers),
    );
  }
}
