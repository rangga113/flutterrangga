import 'package:backend_rpl/models/user_model.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  ///Sebuah method untuk get data ke API dengan method get
  Future<List<UserModel>> getUsers() async {
      final response = await _dio.get('https://jsonplaceholder.typicode.com/users'
      );

      final List<dynamic> data = response.data;

      return data.map((e) => UserModel.fromJson(e)).toList();
  }
}