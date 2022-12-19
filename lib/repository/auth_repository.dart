import 'package:mvvm/data/network/BaseApiServices.dart';
import 'package:mvvm/data/network/NetworkApiService.dart';
import 'package:mvvm/res/components/app_urls.dart';

class AuthRepository {
  final BaseApiServices _apiServices = NetworkApiResponse();

  Future<dynamic> loginAPI(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.loginEndPoint, data);

      return response;
    } catch (e) {
      throw (e.toString());
    }
  }

  Future<dynamic> signUpApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.registerEndPoint, data);

      return response;
    } catch (e) {
      throw e;
    }
  }
}
