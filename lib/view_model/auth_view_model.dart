import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:mvvm/model/user_model.dart';
import 'package:mvvm/repository/auth_repository.dart';
import 'package:mvvm/util/routes/route_name.dart';
import 'package:mvvm/util/utils.dart';
import 'package:mvvm/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class AuthViewModel with ChangeNotifier {
  final _myrepo = AuthRepository();
  bool _loading = false;
  bool get loading => _loading;

  bool _signUpLoading = false;
  bool get signUpLoading => _signUpLoading;
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  setSignUpLoading(bool value) {
    _signUpLoading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _myrepo.loginAPI(data).then((value) {
      setLoading(false);
      final userPreferences =
          Provider.of<UserViewModel>(context, listen: false);
      userPreferences.saveUser(UserModel(
          token: value['token'].toString(),
          userId: value['id'].toString(),
          username: value['username'].toString(),
          name: value['name'].toString()));
      print(value.toString());

      if (value['status'] != 0) {
        Utils.showFlushBarMessage("Login Failed", context);
      } else {
        Navigator.pushNamed(context, RoutesName.main);
      }

      if (kDebugMode) {}
    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) {
        Utils.showFlushBarMessage(error.toString(), context);
      }
    });
  }

  Future<void> SignUpApi(dynamic data, BuildContext context) async {
    setSignUpLoading(true);
    _myrepo.signUpApi(data).then((value) {
      setSignUpLoading(false);
      Utils.showFlushBarMessage("SignUp Successful", context);

      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setSignUpLoading(false);
      if (kDebugMode) {
        Utils.showFlushBarMessage(error.toString(), context);
      }
    });
  }
}
