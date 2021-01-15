import 'package:http/http.dart' as http;
import "dart:convert";
import "../config/config.dart";

class AuthService {
  Future<http.Response> login(String userName, String userPassword) async {
    print("login working ..........");
    final String url = "$baseUrl/authen/login";
    final body = jsonEncode(
        <String, String>{'userName': userName, "userPassword": userPassword});

    final headers = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    };

    final http.Response response =
        await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      print(response.body);
      final respJson = jsonDecode(response.body);
      final temp = respJson['flag'];
      print(respJson);
      print("-----------");
      print(temp);
      return response;
    } else {
      throw Exception("Fail to login");
    }
  }
}

final authService = AuthService();
