import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:get_flutter_starter/domain/requests/login_request_model.dart';
import 'package:get_flutter_starter/domain/requests/register_request_model.dart';

import 'package:get_flutter_starter/domain/services/manager/authentication_manager.dart';
import 'package:get_flutter_starter/domain/services/auth/auth_service.dart';

class LoginViewModel extends GetxController {
  late final AuthService _authService;
  late final AuthenticationManager _authManager;

  @override
  void onInit() {
    super.onInit();
    _authService = Get.put(AuthService());
    _authManager = Get.find();
  }

  Future<void> loginUser(String email, String password) async {
    final response = await _authService
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
    final response = await _authService
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