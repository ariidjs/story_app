import 'package:flutter/material.dart';
import 'package:story_app/app/core/base/base.dart';
import 'package:story_app/app/features/home/controllers/home_controller.dart';

class HomeScreen extends BaseView<HomeController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return Text('Home');
  }
}
