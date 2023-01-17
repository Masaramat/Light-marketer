import 'package:flutter/material.dart';
import 'package:mvvm/res/components/round_button.dart';
import 'package:mvvm/view/resources/color_manager.dart';
import 'package:mvvm/view/resources/values_manager.dart';
import 'package:mvvm/view_model/data_viewModel.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:date_format/date_format.dart';

import '../util/routes/route_name.dart';
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
          title: const Text("Loan Details"),
        ),
        body: ChangeNotifierProvider<LoanViewModel>(
            create: (BuildContext context) => LoanViewModel(),
            child: Consumer<LoanViewModel>(builder: (context, value, _) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(
                            top: AppPadding.p28,
                            left: AppPadding.p12,
                            right: AppPadding.p20),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: AppPadding.p8,
                                          right: AppPadding.p8),
                                      child: Icon(
                                        Icons.person,
                                        color: ColorManager.darkPrimary,
                                        size: AppSize.s28,
                                      ),
                                    ),
                                    Text(
                                      "Name: ",
                                      style:
                                          Theme.of(context).textTheme.headline6,
                                      textAlign: TextAlign.left,
                                    ),
                                  ],
                                )),
                            Expanded(
                              flex: 2,
                              child: Text(
                                _customerName.toString(),
                                style: Theme.of(context).textTheme.titleLarge,
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        )),
                    Padding(
                        padding: const EdgeInsets.only(
                            top: AppPadding.p24, left: AppPadding.p12),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: AppPadding.p8,
                                          right: AppPadding.p8),
                                      child: Icon(
                                        Icons.numbers,
                                        color: ColorManager.darkPrimary,
                                        size: AppSize.s28,
                                      ),
                                    ),
                                    Text(
                                      "Loan Amount:",
                                      style:
                                          Theme.of(context).textTheme.headline6,
                                      textAlign: TextAlign.left,
                                    ),
                                  ],
                                )),
                            Expanded(
                              flex: 1,
                              child: Text(
                                _loanFacility.toString(),
                                style: Theme.of(context).textTheme.titleLarge,
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        )),
                    Padding(
                        padding: const EdgeInsets.only(
                            top: AppPadding.p24, left: AppPadding.p12),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: AppPadding.p8,
                                          right: AppPadding.p8),
                                      child: Icon(
                                        Icons.numbers_sharp,
                                        color: ColorManager.darkPrimary,
                                        size: AppSize.s28,
                                      ),
                                    ),
                                    Text(
                                      "Account No: ",
                                      style:
                                          Theme.of(context).textTheme.headline6,
                                      textAlign: TextAlign.left,
                                    ),
                                  ],
                                )),
                            Expanded(
                              flex: 1,
                              child: Text(
                                _number.toString(),
                                style: Theme.of(context).textTheme.titleLarge,
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        )),
                    Padding(
                        padding: const EdgeInsets.only(
                            top: AppPadding.p24, left: AppPadding.p12),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: AppPadding.p8,
                                          right: AppPadding.p8),
                                      child: Icon(
                                        Icons.date_range_sharp,
                                        color: ColorManager.darkPrimary,
                                        size: AppSize.s28,
                                      ),
                                    ),
                                    Text(
                                      "App date:",
                                      style:
                                          Theme.of(context).textTheme.headline6,
                                      textAlign: TextAlign.left,
                                    ),
                                  ],
                                )),
                            Expanded(
                              flex: 1,
                              child: Text(
                                formatDate(DateTime.parse(_applicationDate),
                                    [dd, "-", mm, "-", yyyy]),
                                style: Theme.of(context).textTheme.titleLarge,
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        )),
                    Padding(
                        padding: const EdgeInsets.only(
                            top: AppPadding.p24, left: AppPadding.p12),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: AppPadding.p8,
                                          right: AppPadding.p8),
                                      child: Icon(
                                        Icons.timelapse,
                                        color: ColorManager.darkPrimary,
                                        size: AppSize.s28,
                                      ),
                                    ),
                                    Text(
                                      "Tenor:",
                                      style:
                                          Theme.of(context).textTheme.headline6,
                                      textAlign: TextAlign.left,
                                    ),
                                  ],
                                )),
                            Expanded(
                              flex: 1,
                              child: Text(
                                _tenor.toString(),
                                style: Theme.of(context).textTheme.titleLarge,
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        )),
                    Padding(
                        padding: const EdgeInsets.only(
                            top: AppPadding.p24, left: AppPadding.p12),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: AppPadding.p8,
                                          right: AppPadding.p8),
                                      child: Icon(
                                        Icons.star_border,
                                        color: ColorManager.darkPrimary,
                                        size: AppSize.s28,
                                      ),
                                    ),
                                    Text(
                                      "Purpose:",
                                      style:
                                          Theme.of(context).textTheme.headline6,
                                      textAlign: TextAlign.left,
                                    ),
                                  ],
                                )),
                            Flexible(
                              flex: 1,
                              child: Text(
                                _purpose.toString(),
                                style: Theme.of(context).textTheme.titleLarge,
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        )),
                    Padding(
                        padding: const EdgeInsets.only(
                            top: AppPadding.p24, left: AppPadding.p12),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: AppPadding.p8,
                                          right: AppPadding.p8),
                                      child: Icon(
                                        Icons.cases,
                                        color: ColorManager.darkPrimary,
                                        size: AppSize.s28,
                                      ),
                                    ),
                                    Text(
                                      "Business:",
                                      style:
                                          Theme.of(context).textTheme.headline6,
                                      textAlign: TextAlign.left,
                                    ),
                                  ],
                                )),
                            Flexible(
                              flex: 1,
                              child: Text(
                                _business.toString(),
                                style: Theme.of(context).textTheme.titleLarge,
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        )),
                    Padding(
                        padding: const EdgeInsets.only(
                            top: AppPadding.p24, left: AppPadding.p12),
                        child: Row(
                          children: [
                            Expanded(
                                child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: AppPadding.p8,
                                      right: AppPadding.p8),
                                  child: Icon(
                                    Icons.location_city,
                                    color: ColorManager.darkPrimary,
                                    size: AppSize.s28,
                                  ),
                                ),
                                Text(
                                  "Address:",
                                  style: Theme.of(context).textTheme.headline6,
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            )),
                            Flexible(
                              child: Text(
                                _address.toString(),
                                style: Theme.of(context).textTheme.titleLarge,
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        )),
                    Padding(
                        padding: const EdgeInsets.only(
                            top: AppPadding.p24, left: AppPadding.p12),
                        child: Row(
                          children: [
                            Expanded(
                                child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: AppPadding.p8,
                                      right: AppPadding.p8),
                                  child: Icon(
                                    Icons.phone,
                                    color: ColorManager.darkPrimary,
                                    size: AppSize.s28,
                                  ),
                                ),
                                Text(
                                  "Phone Number:",
                                  style: Theme.of(context).textTheme.headline6,
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            )),
                            Flexible(
                              child: Text(
                                _phoneNo.toString(),
                                style: Theme.of(context).textTheme.titleLarge,
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        )),
                    Padding(
                        padding: const EdgeInsets.only(
                            top: AppPadding.p24, left: AppPadding.p12),
                        child: Row(
                          children: [
                            Expanded(
                                child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: AppPadding.p8,
                                      right: AppPadding.p8),
                                  child: Icon(
                                    Icons.location_on_outlined,
                                    color: ColorManager.darkPrimary,
                                    size: AppSize.s28,
                                  ),
                                ),
                                Text(
                                  "Location:",
                                  style: Theme.of(context).textTheme.headline6,
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            )),
                            Flexible(
                              child: Text(
                                _location.toString(),
                                style: Theme.of(context).textTheme.titleLarge,
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        )),
                    Padding(
                        padding: const EdgeInsets.only(
                            top: AppPadding.p12, left: AppPadding.p20),
                        child: Row(
                          children: [
                            RoundButton(
                              title: "Call Customer",
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
                              loading: loanViewModel.loading,
                              onPressed: () {
                                Map data = {'application_id': _applicationId};
                                loanViewModel.updateStatusApi(data, context);
                                Navigator.pushNamed(context, RoutesName.main);
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
