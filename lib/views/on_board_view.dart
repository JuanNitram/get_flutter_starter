import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:get_flutter_starter/domain/services/manager/authentication_manager.dart';

import 'package:get_flutter_starter/views/home_view.dart';
import 'package:get_flutter_starter/views/login_view.dart';

class OnBoardView extends StatelessWidget {
  const OnBoardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthenticationManager _authManager = Get.find();

    return Obx(() {
      return _authManager.isLogged.value ? HomeView() : LoginView();
    });
  }
}