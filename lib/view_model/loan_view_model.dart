import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:mvvm/model/user_model.dart';
import 'package:mvvm/repository/auth_repository.dart';
import 'package:mvvm/repository/home_repository.dart';
import 'package:mvvm/util/routes/route_name.dart';
import 'package:mvvm/util/utils.dart';
import 'package:mvvm/view_model/data_viewModel.dart';
import 'package:provider/provider.dart';

import '../model/loan_model.dart';

class LoanViewModel with ChangeNotifier {
  final _myrepo = HomeRepository();
  bool _loading = false;
  bool get loading => _loading;
  Data loanList = Data();

  setLoanList(Data loan) {
    loanList = loan;
    notifyListeners();
  }

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> openLoan(Data data, BuildContext context) async {
    setLoading(true);

    final loanPrefs = Provider.of<DataViewModel>(context, listen: false);
    loanPrefs.saveLoan(
      Data(
          accountNo: data.accountNo,
          loanFacility: data.loanFacility,
          customerName: data.customerName,
          applicationDate: data.applicationDate,
          applicationStatus: data.applicationStatus,
          tenor: data.tenor,
          applicationId: data.applicationId,
          purpose: data.purpose,
          business: data.business,
          address: data.address,
          phoneNo: data.phoneNo,
          bvn: data.bvn,
          locationName: data.locationName),
    );

    setLoading(false);

    if (data.accountNo == null) {
      Utils.showFlushBarMessage("Login Failed", context);
    } else {
      setLoanList(data);
      Navigator.pushNamed(context, RoutesName.loan);
    }

    if (kDebugMode) {}
    // ignore: use_function_type_syntax_for_parameters
  }

  Future<void> updateStatusApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _myrepo.updateLoanStatus(data).then((value) {
      print(value);
      if (value['status'] == 0) {
        Utils.showFlushBarMessage(value['message'], context);
        setLoading(false);
      }

      if (kDebugMode) {}
    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) {
        Utils.showFlushBarMessage(error.toString() + "here", context);
      }
    });
  }
}
