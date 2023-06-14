import 'package:dio/dio.dart';

final options = BaseOptions(
  baseUrl: 'http://186.237.58.195:8080/api/v1/',
  connectTimeout: Duration(seconds: 15),
  receiveTimeout: Duration(seconds: 15),
);
final dio = Dio(options);

class HttpService {
  Future<bool> createAuthToken(String email, String senha) async {
    try {
      final response = await dio.post('/auth/login',
          data: {'email': email, 'password': senha},
          options: Options(
            followRedirects: false,
            validateStatus: (status) {
              return status != 500;
            },
          ));
      print(response);

      if (response.statusCode == 201) {
        print('successfull authentication');
        return true;
      }

      return false;
    } catch (error) {
      print('Server returned error 500');
      return false;
    }
  }

  Future<bool> register(String name, String email, String senha) async {
    try {
      final response = await dio.post('/users',
          data: {'fullName': name, 'email': email, 'password': senha},
          options: Options(
            followRedirects: false,
            validateStatus: (status) {
              return status != 500;
            },
          ));
      print(response);

      if (response.statusCode == 201) {
        print('successfull authentication');
        return true;
      }

      return false;
    } catch (error) {
      print('Server returned error 500');
      return false;
    }
  }
}
