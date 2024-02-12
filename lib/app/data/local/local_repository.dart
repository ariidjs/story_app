import 'package:flutter/services.dart';
import 'package:story_app/app/core/values/constants.dart';
import 'package:story_app/app/data/models/restaurant.dart';

class LocalRepository {
  Future<Restaurants> getListRestaurant() async {
    var data = await rootBundle.loadString(Constants.jsonPath);
    return Restaurants.fromJson(data);
  }
}
