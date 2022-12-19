import 'package:flutter/material.dart';
import 'package:mvvm/data/response/status.dart';
import 'package:mvvm/view_model/home_view_model.dart';
import 'package:mvvm/view_model/loan_view_model.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  HomeViewViewModel homeViewViewModel = HomeViewViewModel();
  LoanViewModel loanViewModel = LoanViewModel();
  late var _userName = "";
  late var _userId = "";
  late var _fullname = "";

  Future<String?> _getuser() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString("id") ?? "Hello";
    final userName = prefs.getString("username") ?? "Hello";
    final userFullname = prefs.getString("fullname") ?? "Hello";

    setState(() {
      _userId = userId;
      _userName = userName;
      _fullname = userFullname;
      homeViewViewModel.fetchLoanListApi(_userId);
    });
  }

  @override
  void initState() {
    _getuser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeViewViewModel>(
      create: (BuildContext context) => homeViewViewModel,
      //todo, check for null values so data cannot push us to error
      child: Consumer<HomeViewViewModel>(builder: (context, value, _) {
        switch (value.loanList.status) {
          case Status.LOADING:
            return const Center(child: CircularProgressIndicator());
          case Status.ERROR:
            return Center(child: Text(value.loanList.message.toString()));
          case Status.COMPLETED:
            return ListView.builder(
                itemCount: value.loanList.data!.data.length,
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: (() {
                        loanViewModel.openLoan(
                            value.loanList.data!.data[index], context);
                      }),
                      child: Card(
                        child: ListTile(
                          title: Text(value
                              .loanList.data!.data[index].customerName
                              .toString()),
                          subtitle: Text(value
                              .loanList.data!.data[index].loanFacility
                              .toString()),
                        ),
                      ));
                });
          case null:
            return const Center(
              child: Text("No Loans Found"),
            );
        }
        // ignore: dead_code
        return const Center(
          child: Text("No Loans Found"),
        );
      }),
    );
  }
}
