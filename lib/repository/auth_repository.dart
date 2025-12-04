import 'package:dio/dio.dart';

class AuthRepository {
  final Dio _dio;

  AuthRepository([Dio? dio]) : _dio = dio ?? Dio() {
    _dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
  }

  Future<Map<String, dynamic>> createUser({
    required String nama,
    required String username,
    required String password,
  }) async {
    final body = {
      // sesuaikan key sesuai API: 'name' atau 'nama'
      'name': nama,
      'username': username,
      'password': password,
    };

    try {
      final response = await _dio.post(
        'https://news-rpl-api.vercel.app/api/users',
        data: body,
      );
      return (response.data ?? {}) as Map<String, dynamic>;
    } on DioException catch (e) {
      if (e.response != null) {
        // tampilkan pesan dan data response dari server supaya jelas kenapa 400
        throw Exception('Request failed (${e.response!.statusCode}): ${e.response!.data}');
      }
      throw Exception('Network error: ${e.message}');
    }
  }
}