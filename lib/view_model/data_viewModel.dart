import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/loan_model.dart';

class DataViewModel with ChangeNotifier {
  Future<bool> saveLoan(Data loan) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString("account_number", loan.accountNo.toString());
    sp.setInt("loan_facility", loan.loanFacility!);
    sp.setString("application_date", loan.applicationDate.toString());
    sp.setString("application_status", loan.applicationStatus.toString());
    sp.setString("customer_name", loan.customerName!);
    sp.setString("tenor", loan.tenor.toString());
    sp.setInt("application_id", loan.applicationId!);
    sp.setString("purpose", loan.purpose.toString());
    sp.setString("business", loan.business.toString());
    sp.setString("address", loan.address!);
    sp.setString("phone_number", loan.phoneNo.toString());
    sp.setString("bvn", loan.bvn!);
    sp.setString("location", loan.locationName.toString());
    notifyListeners();
    return true;
  }

  Future<Data> getLoan() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();

    final String? customerName = sp.getString('customer_name');
    final int? loanFacility = sp.getInt('loan_facility');
    final String? accountNumber = sp.getString('account_number');
    final String? applicationDate = sp.getString('application_date');
    final String? applicationStatus = sp.getString('application_status');
    final String? tenor = sp.getString('tenor');
    final int? applicationId = sp.getInt('application_id');
    final String? purpose = sp.getString('purpose');
    final String? business = sp.getString('business');
    final String? address = sp.getString('address');
    final String? phoneNo = sp.getString('phone_number');
    final String? bvn = sp.getString('bvn');
    final String? location = sp.getString('location');

    return Data(
        customerName: customerName.toString(),
        loanFacility: loanFacility,
        accountNo: accountNumber.toString(),
        applicationDate: applicationDate.toString(),
        applicationStatus: applicationStatus.toString(),
        tenor: tenor.toString(),
        applicationId: applicationId,
        purpose: purpose.toString(),
        business: business.toString(),
        address: address.toString(),
        phoneNo: phoneNo.toString(),
        bvn: bvn.toString(),
        locationName: location.toString());
  }

  Future<bool> remove() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove("token");

    return true;
  }
}
