import 'package:flutter/widgets.dart';
import 'package:mvvm/data/response/api_response.dart';
import 'package:mvvm/model/loan_model.dart';
import 'package:mvvm/repository/home_repository.dart';

class HomeViewViewModel with ChangeNotifier {
  final _myRepo = HomeRepository();

  ApiResponse<LoanListModel> loanList = ApiResponse.loading();

  setLoanList(ApiResponse<LoanListModel> response) {
    loanList = response;
    notifyListeners();
  }

  Future<void> fetchLoanListApi(String id) async {
    setLoanList(ApiResponse.loading());
    _myRepo.fetchLoans(id).then((value) {
      setLoanList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setLoanList(ApiResponse.error(error.toString()));
    });
  }
}
