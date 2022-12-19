import 'package:flutter/material.dart';
import 'package:mvvm/res/color.dart';
import 'package:mvvm/res/components/round_button.dart';
import 'package:mvvm/util/routes/route_name.dart';
import 'package:mvvm/util/utils.dart';
import 'package:mvvm/view/resources/assets_manager.dart';
import 'package:mvvm/view/resources/color_manager.dart';
import 'package:mvvm/view/resources/strings_manager.dart';
import 'package:mvvm/view/resources/values_manager.dart';
import 'package:mvvm/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    _obsecurePassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Login"),
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: ColorManager.primary,
        ),
        body: Container(
            padding: const EdgeInsets.only(top: AppPadding.p100),
            child: SingleChildScrollView(
              child: Form(
                  child: Column(
                children: [
                  const SizedBox(height: AppSize.s100),
                  Padding(
                      padding: const EdgeInsets.only(
                          left: AppPadding.p28, right: AppPadding.p28),
                      child: TextFormField(
                        controller: _emailController,
                        cursorColor: ColorManager.primary,
                        focusNode: emailFocusNode,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          hintText: AppStrings.emailHint,
                          prefixIcon: Icon(Icons.mail),
                          labelText: AppStrings.emailHint,
                        ),
                        onFieldSubmitted: (value) {
                          Utils.focusChange(
                              context, emailFocusNode, passwordFocusNode);
                        },
                      )),
                  const SizedBox(height: AppSize.s28),
                  Padding(
                      padding: const EdgeInsets.only(
                          left: AppPadding.p28, right: AppPadding.p28),
                      child: ValueListenableBuilder(
                          valueListenable: _obsecurePassword,
                          builder: (context, value, child) {
                            return TextFormField(
                              controller: _passwordController,
                              focusNode: passwordFocusNode,
                              obscureText: _obsecurePassword.value,
                              obscuringCharacter: "*",
                              decoration: InputDecoration(
                                  hintText: AppStrings.password,
                                  prefixIcon:
                                      const Icon(Icons.lock_clock_outlined),
                                  labelText: AppStrings.password,
                                  suffixIcon: InkWell(
                                    onTap: () {
                                      _obsecurePassword.value =
                                          !_obsecurePassword.value;
                                    },
                                    child: Icon(_obsecurePassword.value
                                        ? Icons.visibility_off
                                        : Icons.visibility),
                                  )),
                            );
                          })),
                  const SizedBox(height: AppSize.s28),
                  RoundButton(
                      title: AppStrings.login,
                      loading: authViewModel.loading,
                      onPressed: () {
                        if (_emailController.text.isEmpty) {
                          Utils.showFlushBarMessage(
                              "Please Enter a valid email", context);
                        } else if (_passwordController.text.isEmpty) {
                          Utils.showFlushBarMessage(
                              "Please enter password", context);
                        } else if (_passwordController.text.length < 6) {
                          Utils.showFlushBarMessage(
                              "Please long password", context);
                        } else {
                          Map data = {
                            'email': _emailController.text.toString(),
                            'password': _passwordController.text.toString()
                          };
                          authViewModel.loginApi(data, context);
                        }
                      }),
                  SizedBox(
                    height: height * .02,
                  ),
                  InkWell(
                    onTap: () {
                      //Navigator.pushNamed(context, RoutesName.signup);
                    },
                    child: const Text("Any Problem? Contact Administrator"),
                  )
                ],
              )),
            )));
  }
}
