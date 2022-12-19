import 'package:flutter/material.dart';
import 'package:mvvm/res/components/round_button.dart';
import 'package:mvvm/view/resources/color_manager.dart';
import 'package:mvvm/view/resources/values_manager.dart';
import 'package:mvvm/view_model/data_viewModel.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:date_format/date_format.dart';

import '../view_model/loan_view_model.dart';

class LoanApplication extends StatefulWidget {
  const LoanApplication({super.key});

  @override
  State<LoanApplication> createState() => _LoanApplicationState();
}

class _LoanApplicationState extends State<LoanApplication> {
  LoanViewModel loanViewModel = LoanViewModel();
  @override
  void initState() {
    _getloan();
    super.initState();
  }

  late var _number = "";
  late var _customerName = "";
  late int _loanFacility = 0;
  late var _applicationDate = "";
  late var _tenor = "";
  late int _applicationId = 0;
  late var _purpose = "";
  late var _business = "";
  late var _address = "";
  late var _phoneNo = "";
  late var _bvn = "";
  late var _location = "";

  Future<String?> _getloan() async {
    final prefs = await SharedPreferences.getInstance();
    final number = prefs.getString("account_number") ?? "Hello";
    final customerName = prefs.getString("customer_name") ?? "Hello";
    final applicationDate = prefs.getString("application_date") ?? "Hello";
    final tenor = prefs.getString("tenor") ?? "Hello";
    final applicationId = prefs.getInt("application_id") ?? 0;
    final loanFacility = prefs.getInt("loan_facility") ?? 0;
    final purpose = prefs.getString("purpose") ?? "Hello";
    final business = prefs.getString("business") ?? "Hello";
    final address = prefs.getString("address") ?? "Hello";
    final phoneNo = prefs.getString("phone_number") ?? "Hello";
    final bvn = prefs.getString("bvn") ?? "Hello";
    final location = prefs.getString("location") ?? "Hello";

    setState(() {
      _number = number;
      _customerName = customerName;
      _applicationDate = applicationDate;
      _tenor = tenor;
      _purpose = purpose;
      _business = business;
      _address = address;
      _phoneNo = phoneNo;
      _applicationId = applicationId;
      _bvn = bvn;
      _location = location;
      _loanFacility = loanFacility;
    });
  }

  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final loanPreferences = Provider.of<LoanViewModel>(context);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorManager.primary,
          title: const Text("Loan Application"),
        ),
        body: ChangeNotifierProvider<LoanViewModel>(
            create: (BuildContext context) => LoanViewModel(),
            child: Consumer<LoanViewModel>(builder: (context, value, _) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: AppPadding.p8),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Loan Details",
                          style: Theme.of(context).textTheme.headlineMedium,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(
                            top: AppPadding.p12, left: AppPadding.p20),
                        child: Row(
                          children: [
                            Text(
                              "Name: ",
                              style: Theme.of(context).textTheme.headline6,
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              _customerName,
                              style: Theme.of(context).textTheme.headline6,
                              textAlign: TextAlign.left,
                            ),
                          ],
                        )),
                    Padding(
                        padding: const EdgeInsets.only(
                            top: AppPadding.p12, left: AppPadding.p20),
                        child: Row(
                          children: [
                            Text(
                              "Loan Amount: ",
                              style: Theme.of(context).textTheme.headline6,
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              _loanFacility.toString(),
                              style: Theme.of(context).textTheme.headline6,
                              textAlign: TextAlign.left,
                            ),
                          ],
                        )),
                    Padding(
                        padding: const EdgeInsets.only(
                            top: AppPadding.p12, left: AppPadding.p20),
                        child: Row(
                          children: [
                            Text(
                              "Account Number: ",
                              style: Theme.of(context).textTheme.headline6,
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              _number,
                              style: Theme.of(context).textTheme.headline6,
                              textAlign: TextAlign.left,
                            ),
                          ],
                        )),
                    Padding(
                        padding: const EdgeInsets.only(
                            top: AppPadding.p12, left: AppPadding.p20),
                        child: Row(
                          children: [
                            Text(
                              "Application date: ",
                              style: Theme.of(context).textTheme.headline6,
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              formatDate(DateTime.parse(_applicationDate),
                                  [dd, "-", mm, "-", yyyy]),
                              style: Theme.of(context).textTheme.headline6,
                              textAlign: TextAlign.left,
                            ),
                          ],
                        )),
                    Padding(
                        padding: const EdgeInsets.only(
                            top: AppPadding.p12, left: AppPadding.p20),
                        child: Row(
                          children: [
                            Text(
                              "Tenor: ",
                              style: Theme.of(context).textTheme.headline6,
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              _tenor,
                              style: Theme.of(context).textTheme.headline6,
                              textAlign: TextAlign.left,
                            ),
                          ],
                        )),
                    Padding(
                        padding: const EdgeInsets.only(
                            top: AppPadding.p12, left: AppPadding.p20),
                        child: Row(
                          children: [
                            Text(
                              "Purpose: ",
                              style: Theme.of(context).textTheme.headline6,
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              _purpose,
                              style: Theme.of(context).textTheme.headline6,
                              textAlign: TextAlign.left,
                            ),
                          ],
                        )),
                    Padding(
                        padding: const EdgeInsets.only(
                            top: AppPadding.p12, left: AppPadding.p20),
                        child: Row(
                          children: [
                            Text(
                              "Business: ",
                              style: Theme.of(context).textTheme.headline6,
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              _business,
                              style: Theme.of(context).textTheme.headline6,
                              textAlign: TextAlign.left,
                            ),
                          ],
                        )),
                    Padding(
                        padding: const EdgeInsets.only(
                            top: AppPadding.p12, left: AppPadding.p20),
                        child: Row(
                          children: [
                            Text(
                              "Address: ",
                              style: Theme.of(context).textTheme.headline6,
                              textAlign: TextAlign.left,
                            ),
                            Flexible(
                                child: Text(
                              _address,
                              style: Theme.of(context).textTheme.headline6,
                              textAlign: TextAlign.left,
                            )),
                          ],
                        )),
                    Padding(
                        padding: const EdgeInsets.only(
                            top: AppPadding.p12, left: AppPadding.p20),
                        child: Row(
                          children: [
                            Text(
                              "Phone Number: ",
                              style: Theme.of(context).textTheme.headline6,
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              _phoneNo,
                              style: Theme.of(context).textTheme.headline6,
                              textAlign: TextAlign.left,
                            ),
                          ],
                        )),
                    Padding(
                        padding: const EdgeInsets.only(
                            top: AppPadding.p12, left: AppPadding.p20),
                        child: Row(
                          children: [
                            Text(
                              "BVN: ",
                              style: Theme.of(context).textTheme.headline6,
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              _bvn,
                              style: Theme.of(context).textTheme.headline6,
                              textAlign: TextAlign.left,
                            ),
                          ],
                        )),
                    Padding(
                        padding: const EdgeInsets.only(
                            top: AppPadding.p12, left: AppPadding.p20),
                        child: Row(
                          children: [
                            Text(
                              "Application ID: ",
                              style: Theme.of(context).textTheme.headline6,
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              _applicationId.toString(),
                              style: Theme.of(context).textTheme.headline6,
                              textAlign: TextAlign.left,
                            ),
                          ],
                        )),
                    Padding(
                        padding: const EdgeInsets.only(
                            top: AppPadding.p12, left: AppPadding.p20),
                        child: Row(
                          children: [
                            Text(
                              "Location: ",
                              style: Theme.of(context).textTheme.headline6,
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              _location,
                              style: Theme.of(context).textTheme.headline6,
                              textAlign: TextAlign.left,
                            ),
                          ],
                        )),
                    Padding(
                        padding: const EdgeInsets.only(
                            top: AppPadding.p12, left: AppPadding.p20),
                        child: Row(
                          children: [
                            RoundButton(
                              title: "Call Him",
                              onPressed: () {
                                setState(() {
                                  _makePhoneCall('tel:$_phoneNo');
                                });
                              },
                            ),
                            const SizedBox(
                              width: AppSize.s12,
                            ),
                            RoundButton(
                              title: "Update Status",
                              onPressed: () {
                                Map data = {'application_id': _applicationId};
                                loanViewModel.updateStatusApi(data, context);
                              },
                            ),
                          ],
                        )),
                  ],
                ),
              );
            })));
  }
}
