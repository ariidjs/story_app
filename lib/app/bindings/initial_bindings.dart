import 'package:get/get.dart';
import 'package:story_app/app/bindings/repository_bindings.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    RepositoryBindings().dependencies();
  }
}
