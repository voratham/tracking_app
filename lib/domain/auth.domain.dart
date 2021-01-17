import 'package:shared_preferences/shared_preferences.dart';
import "dart:convert";
import "../models/user.model.dart";
import "../adapters/auth.service.dart";

class AuthDomain {
  AuthService _authService;

  AuthDomain(AuthService authService) {
    this._authService = authService;
  }

  Future<User> login(String userName, String userPassword) async {
    try {
      var user = await this._authService.login(userName, userPassword);
      await this.save(user);
      return user;
    } catch (error) {
      throw error;
    }
  }

  Future<void> save(User user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("user", jsonEncode(user));
  }

  Future<bool> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final responseJson = prefs.getString("user") ?? "";
    if (responseJson.isEmpty) return false;
    final user = User.fromJson(jsonDecode(responseJson));
    return user.jwtToken.isNotEmpty ? true : false;
  }
}

final authDomain = AuthDomain(AuthService());
