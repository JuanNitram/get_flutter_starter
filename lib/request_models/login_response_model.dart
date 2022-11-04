class LoginResponseModel {
  String? type;
  String? token;

  LoginResponseModel({this.type, this.token});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    type = json['data']['type'];
    token = json['data']['token'];
  }
}