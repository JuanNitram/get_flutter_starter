import 'package:get/get_connect.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';

import 'package:get_flutter_starter/request_models/login_response_model.dart';
import 'package:get_flutter_starter/request_models/login_request_model.dart';
import 'package:get_flutter_starter/request_models/register_response_model.dart';
import 'package:get_flutter_starter/request_models/register_request_model.dart';

class LoginManager extends GetConnect {
  final String loginUrl = 'http://localhost:3333/auth/login';
  final String registerUrl = '';

  
  Future<LoginResponseModel?> fetchLogin(LoginRequestModel model) async {
    final response = await post(loginUrl, model.toJson());

    if (response.statusCode == HttpStatus.ok) {
      return LoginResponseModel.fromJson(response.body);
    } else {
      return null;
    }
  }

  Future<RegisterResponseModel?> fetchRegister(RegisterRequestModel model) async {
    final response = await post(registerUrl, model.toJson());

    if (response.statusCode == HttpStatus.ok) {
      return RegisterResponseModel.fromJson(response.body);
    } else {
      return null;
    }
  }
}
