import 'package:flutter/material.dart';
import 'package:mvvm/util/routes/route_name.dart';
import 'package:provider/provider.dart';

import '../res/components/round_button.dart';
import '../util/utils.dart';
import '../view_model/auth_view_model.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(false);
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
          title: const Text("SignUp"),
          centerTitle: true,
        ),
        body: Center(
          child: SafeArea(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: _emailController,
                focusNode: emailFocusNode,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: "Email",
                  prefixIcon: Icon(Icons.mail),
                  labelText: "Email",
                ),
                onFieldSubmitted: (value) {
                  Utils.focusChange(context, emailFocusNode, passwordFocusNode);
                },
              ),
              ValueListenableBuilder(
                  valueListenable: _obsecurePassword,
                  builder: (context, value, child) {
                    return TextFormField(
                      controller: _passwordController,
                      focusNode: passwordFocusNode,
                      obscureText: _obsecurePassword.value,
                      obscuringCharacter: "*",
                      decoration: InputDecoration(
                          hintText: "password",
                          prefixIcon: const Icon(Icons.lock_clock_outlined),
                          labelText: "password",
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
                  }),
              SizedBox(
                height: height * .1,
              ),
              RoundButton(
                  title: "SignUp",
                  loading: authViewModel.signUpLoading,
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
                      authViewModel.SignUpApi(data, context);
                      print("Api hit");
                    }
                  }),
              SizedBox(
                height: height * .02,
              ),
              InkWell(
                onTap: (() {
                  Navigator.pushNamed(context, RoutesName.login);
                }),
                child: const Text("Already have an account? Login"),
              )
            ],
          )),
        ));
  }
}
