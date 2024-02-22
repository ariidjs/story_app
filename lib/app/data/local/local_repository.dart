import 'package:get_storage/get_storage.dart';
import 'package:rxdart/rxdart.dart';
import 'package:story_app/app/core/di/injector.dart';

class LocalRepository {
  final storage = injector.get<GetStorage>();
  final BehaviorSubject<String?> _authState = BehaviorSubject.seeded(null);

  String? get token => _authState.value;

  Stream<String?> authStateChanges() {
    return _authState.stream;
  }
}
