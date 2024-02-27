import 'package:get/get.dart';
import 'package:story_app/app/core/models/auth_response.dart';
import 'package:story_app/app/data/models/requests/sign_in_request.dart';
import 'package:story_app/app/data/models/requests/sign_up_request.dart';
import 'package:story_app/app/data/models/response/stories_response.dart';
import 'package:story_app/app/data/remote/remote_data_source.dart';

class StoryRepository {
  final RemoteDataSource _remoteSource =
      Get.find(tag: (RemoteDataSource).toString());

  Future<AuthResponse> signUp(SignUpRequest form) async {
    var data = await _remoteSource.signUp(form);
    return data;
  }

  Future<LoginResult?> signIn(SignInRequest form) async {
    var data = await _remoteSource.signIn(form);
    return data.loginResult;
  }

  Future<List<ListStory>?> getStories() async {
    var data = await _remoteSource.getStories();
    return data.listStory;
  }
}
