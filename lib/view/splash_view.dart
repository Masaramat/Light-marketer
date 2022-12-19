import 'package:flutter/material.dart';
import 'package:mvvm/view/resources/assets_manager.dart';
import 'package:mvvm/view/resources/color_manager.dart';
import 'package:mvvm/view/resources/values_manager.dart';

import '../view_model/services/splash_services.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  SplashServices splashServices = SplashServices();
  @override
  void initState() {
    super.initState();
    splashServices.checkAuthentication(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: const Center(
        child: Image(
          image: AssetImage(ImageAssets.splashLogo),
          height: AppSize.s220,
        ),
      ),
    );
  }
}
