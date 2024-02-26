class AuthResponse {
  bool? error;
  String? message;
  LoginResult? loginResult;

  AuthResponse({this.error, this.message, this.loginResult});

  AuthResponse.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    message = json['message'];
    loginResult = json['loginResult'] != null
        ? new LoginResult.fromJson(json['loginResult'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = error;
    data['message'] = message;
    if (loginResult != null) {
      data['loginResult'] = loginResult!.toJson();
    }
    return data;
  }
}

class LoginResult {
  String? userId;
  String? name;
  String? token;

  LoginResult({this.userId, this.name, this.token});

  LoginResult.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    name = json['name'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['name'] = name;
    data['token'] = token;
    return data;
  }
}
