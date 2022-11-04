import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:get_flutter_starter/components/auth/login_form.dart';
import 'package:get_flutter_starter/components/auth/register_form.dart';

import 'package:get_flutter_starter/components/text_styles/text_subtitle_style.dart';
import 'package:get_flutter_starter/view_models/login_view_model.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> formKey = GlobalKey();

  final LoginViewModel _viewModel = Get.put(LoginViewModel());

  bool rememberMe = false;

  TextEditingController emailCtr = TextEditingController();
  TextEditingController passwordCtr = TextEditingController();

  FormType _formType = FormType.login;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              Image.asset('assets/images/login-header.png'),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.70,
                child: Text(
                  _formType == FormType.login
                      ? "By signing in you are agreeing our Terms and privacy policy"
                      : "By signing up you are agreeing our Terms and privacy policy",
                  style: textSubtitleStyle(),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _formType = FormType.login;
                          });
                        },
                        child: Container(
                          child: Text(
                            "Login",
                            style: textSubtitleStyle(),
                          ),
                          decoration: _formType == FormType.login
                              ? const BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                  width: 3,
                                  color: Color(0xff469FD1),
                                )))
                              : null,
                        ),
                      )),
                  Padding(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _formType = FormType.register;
                          });
                        },
                        child: Container(
                          child: Text(
                            "Register",
                            style: textSubtitleStyle(),
                          ),
                          decoration: _formType == FormType.register
                              ? const BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                  width: 3,
                                  color: Color(0xff469FD1),
                                )))
                              : null,
                        ),
                      )),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35.0),
                child: _formType == FormType.login
                    ? loginForm(
                        viewModel: _viewModel,
                        formKey: formKey,
                        emailCtr: emailCtr,
                        passwordCtr: passwordCtr,
                        rememberMe: rememberMe)
                    : registerForm(
                        viewModel: _viewModel, formKey: formKey, emailCtr: emailCtr, passwordCtr: passwordCtr),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum FormType { login, register }