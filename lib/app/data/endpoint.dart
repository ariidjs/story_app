import 'api_config.dart';

class Endpoint {
  static var baseUrl = ApiConfig.baseUrl;

  static var restaurantList = '$baseUrl/list';
  static var addReview = '$baseUrl/review';
  static var search = '$baseUrl/search';

  static String restaurantById(String id) => '$baseUrl/detail/$id';
}
