import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:get_flutter_starter/request_models/login_request_model.dart';
import 'package:get_flutter_starter/request_models/register_request_model.dart';
import 'package:get_flutter_starter/services/auth/authentication_manager.dart';
import 'package:get_flutter_starter/services/auth/login_manager.dart';

class LoginViewModel extends GetxController {
  late final LoginManager _loginManager;
  late final AuthenticationManager _authManager;

  @override
  void onInit() {
    super.onInit();
    _loginManager = Get.put(LoginManager());
    _authManager = Get.find();
  }

  Future<void> loginUser(String email, String password) async {
    final response = await _loginManager
        .fetchLogin(LoginRequestModel(email: email, password: password));

    if (response != null) {
      /// Set isLogin to true
      _authManager.login(response.token);
    } else {
      /// Show user a dialog about the error response
      Get.defaultDialog(
          middleText: 'User not found!',
          textConfirm: 'OK',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          });
    }
  }

  Future<void> registerUser(String email, String password) async {
    final response = await _loginManager
        .fetchRegister(RegisterRequestModel(email: email, password: password));

    if (response != null) {
      /// Set isLogin to true
      _authManager.login(response.token);
    } else {
      /// Show user a dialog about the error response
      Get.defaultDialog(
          middleText: 'Register Error',
          textConfirm: 'OK',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          });
    }
  }
}