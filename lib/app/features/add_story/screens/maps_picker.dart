import 'package:flutter/material.dart';
import 'package:story_app/app/core/base/base.dart';
import 'package:story_app/app/features/add_story/controllers/add_controller.dart';
import 'package:story_app/app/features/add_story/models/add_models.dart';

class MapsPicker extends BaseView<AddController> {
  final AddModels data;

  MapsPicker({super.key, required this.data});
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return Container();
  }
}
