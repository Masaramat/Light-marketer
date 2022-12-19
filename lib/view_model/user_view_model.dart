import 'package:flutter/widgets.dart';
import 'package:mvvm/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel with ChangeNotifier {
  Future<bool> saveUser(UserModel user) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString("token", user.token.toString());
    sp.setString("username", user.username.toString());
    sp.setString("id", user.userId.toString());
    sp.setString("fullname", user.name.toString());
    notifyListeners();
    return true;
  }

  Future<UserModel> getUser() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();

    final String? token = sp.getString("token");
    final String? username = sp.getString("username");
    final String? userId = sp.getString("id");
    final String? name = sp.getString("fullname");

    return UserModel(
        token: token.toString(),
        userId: userId.toString(),
        username: username.toString(),
        name: name.toString());
  }

  Future<bool> remove() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove("token");

    return true;
  }
}
