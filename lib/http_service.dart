import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpService {
  final String BACKEND_URL = "http://186.237.58.195:8080/api/v1/auth/login";

  Future<bool> login(String email, String senha) async {
    http.Response res = await http.post(Uri.parse(BACKEND_URL),
        body: {'email': email, 'password': senha});

    final body = jsonDecode(res.body);
    print(body);

    if (body.statusCode == 200) {
      return true;
    }

    return false;
  }
}
