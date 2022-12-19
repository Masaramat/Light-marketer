import 'package:flutter/material.dart';
import 'package:mvvm/view/profile_view.dart';
import 'package:mvvm/view/resources/color_manager.dart';
import 'package:mvvm/view/resources/strings_manager.dart';
import 'package:mvvm/view/resources/values_manager.dart';
import 'package:mvvm/view/settings_view.dart';
import 'package:provider/provider.dart';

import '../util/routes/route_name.dart';
import '../view_model/user_view_model.dart';
import 'home_view.dart';
import 'notification_view.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  List<Widget> pages = [
    HomePageView(),
    ProfilePage(),
    NotificationsPage(),
    SettingsPage()
  ];
  List<String> titles = [
    AppStrings.home,
    AppStrings.profile,
    AppStrings.notifications,
    AppStrings.settings,
  ];
  var _title = AppStrings.home;
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final userPreferences = Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: AppBar(
          title: Text(
            _title,
            style: TextStyle(color: ColorManager.white),
          ),
          backgroundColor: ColorManager.primary,
          automaticallyImplyLeading: false,
          actions: [
            InkWell(
              child: const Center(child: Text("Logout")),
              onTap: () {
                userPreferences.remove().then((value) {
                  Navigator.pushNamed(context, RoutesName.login);
                });
              },
            ),
            const SizedBox(
              width: 20,
            )
          ]),
      body: pages[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(color: ColorManager.lightGrey, spreadRadius: AppSize.s1)
        ]),
        child: BottomNavigationBar(
          selectedItemColor: ColorManager.primary,
          unselectedItemColor: ColorManager.grey,
          currentIndex: _currentIndex,
          onTap: onTap,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home), label: AppStrings.home),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), label: AppStrings.profile),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications),
                label: AppStrings.notifications),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: AppStrings.settings),
          ],
        ),
      ),
    );
  }

  onTap(int index) {
    setState(() {
      _currentIndex = index;
      _title = titles[index];
    });
  }
}
