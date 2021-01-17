import 'package:http/http.dart' as http;
import 'package:tracking_app/models/dailyWorking.model.dart';
import "dart:convert";
import '../models/dailyWorking.model.dart';
import "../models/user.model.dart";
import '../config/config.dart';

class DailyWorkingService {
  deserialize(String data) {
    return jsonDecode(data);
  }

  Future<DailyWorking> startWorking(User user) async {
    final String url = "$baseUrl/dw/start";

    final headers = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      "Authorization": 'Bearer ${user.jwtToken}'
    };

    final http.Response response = await http.post(url, headers: headers);

    if (response.statusCode == 200) {
      final responseJson = this.deserialize(response.body);
      if (responseJson['flag'] == false) {
        throw Exception(responseJson['message']);
      } else {
        return DailyWorking.fromJson(responseJson['data']);
      }
    } else {
      throw Exception("Not found daily working");
    }
  }
}

final dailyWorkingService = DailyWorkingService();
