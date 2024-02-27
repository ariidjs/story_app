import 'api_config.dart';

class Endpoint {
  static var baseUrl = ApiConfig.baseUrl;

  static var signUp = '$baseUrl/register';
  static var signIn = '$baseUrl/login';
  static var stories = '$baseUrl/stories';
}
