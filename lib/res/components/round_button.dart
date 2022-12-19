import 'package:flutter/material.dart';
import 'package:mvvm/res/color.dart';
import 'package:mvvm/view/resources/color_manager.dart';
import 'package:mvvm/view/resources/values_manager.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onPressed;
  const RoundButton(
      {Key? key,
      required this.title,
      this.loading = false,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: AppSize.s50,
        width: AppSize.s140,
        decoration: BoxDecoration(
          color: ColorManager.primary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
            child: loading
                ? const CircularProgressIndicator(
                    color: Colors.white,
                  )
                : Text(
                    title,
                    style: TextStyle(color: AppColor.whiteColor),
                  )),
      ),
    );
  }
}
