import 'package:mvvm/data/network/NetworkApiService.dart';
import 'package:mvvm/model/loan_model.dart';

import '../data/network/BaseApiServices.dart';
import '../res/components/app_urls.dart';

class HomeRepository {
  final BaseApiServices _apiServices = NetworkApiResponse();

  Future<LoanListModel> fetchLoans(String id) async {
    try {
      dynamic response =
          await _apiServices.getGetApiResponse("${AppUrl.loanEndPoint}?id=$id");

      return response = LoanListModel.fromJson(response);
    } catch (e) {
      throw (e.toString());
    }
  }
}
