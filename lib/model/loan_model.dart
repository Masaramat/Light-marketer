class LoanListModel {
  int? status;
  String? message;
  List<Data> data = <Data>[];

  LoanListModel({this.status, this.message, required this.data});

  LoanListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['data'] = this.data.map((v) => v.toJson()).toList();
    return data;
  }
}

class Data {
  int? applicationId;
  String? accountNo;
  int? loanFacility;
  String? tenor;
  String? customerName;
  String? applicationDate;
  String? purpose;
  String? business;
  String? address;
  String? phoneNo;
  String? bvn;
  String? applicationStatus;
  String? locationName;
  String? branchName;

  Data(
      {this.applicationId,
      this.accountNo,
      this.loanFacility,
      this.tenor,
      this.customerName,
      this.applicationDate,
      this.purpose,
      this.business,
      this.address,
      this.phoneNo,
      this.bvn,
      this.applicationStatus,
      this.locationName,
      this.branchName});

  Data.fromJson(Map<String, dynamic> json) {
    applicationId = json['application_id'];
    accountNo = json['account_no'];
    loanFacility = json['loan_facility'];
    tenor = json['tenor'];
    customerName = json['customer_name'];
    applicationDate = json['application_date'];
    purpose = json['purpose'];
    business = json['business'];
    address = json['address'];
    phoneNo = json['phone_no'];
    bvn = json['bvn'];
    applicationStatus = json['application_status'];
    locationName = json['location_name'];
    branchName = json['branch_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['application_id'] = this.applicationId;
    data['account_no'] = this.accountNo;
    data['loan_facility'] = this.loanFacility;
    data['tenor'] = this.tenor;
    data['customer_name'] = this.customerName;
    data['application_date'] = this.applicationDate;
    data['purpose'] = this.purpose;
    data['business'] = this.business;
    data['address'] = this.address;
    data['phone_no'] = this.phoneNo;
    data['bvn'] = this.bvn;
    data['application_status'] = this.applicationStatus;
    data['location_name'] = this.locationName;
    data['branch_name'] = this.branchName;
    return data;
  }
}
