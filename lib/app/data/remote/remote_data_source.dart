import 'package:dio/dio.dart';
import 'package:story_app/app/core/base/base_remote_source.dart';
import 'package:story_app/app/core/models/auth_response.dart';
import 'package:story_app/app/data/endpoint.dart';
import 'package:story_app/app/data/models/requests/add_story_request.dart';
import 'package:story_app/app/data/models/requests/sign_in_request.dart';
import 'package:story_app/app/data/models/requests/sign_up_request.dart';
import 'package:story_app/app/data/models/response/stories_response.dart';

class RemoteDataSource extends BaseRemoteSource {
  Future<AuthResponse> signUp(SignUpRequest form) {
    var dioCall = dioClient.post(Endpoint.signUp, data: form.toMap());

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => AuthResponse.fromJson(response.data));
    } catch (e) {
      rethrow;
    }
  }

  Future<AuthResponse> signIn(SignInRequest form) {
    var dioCall = dioClient.post(Endpoint.signIn, data: form.toMap());

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => AuthResponse.fromJson(response.data));
    } catch (e) {
      rethrow;
    }
  }

  Future<StoriesResponse> getStories() {
    var dioCall = dioClientWithAuth.get(Endpoint.stories);

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => StoriesResponse.fromJson(response.data));
    } catch (e) {
      rethrow;
    }
  }

  Future<StoriesResponse> addStory(AddStoryRequest form) async {
    dioClientWithAuth.options.contentType = 'multipart/form-data';
    var dioCall = dioClientWithAuth.post(Endpoint.stories,
        data: FormData.fromMap({
          'description': form.desc,
          'photo': await MultipartFile.fromFile(form.photoPath)
        }));

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => StoriesResponse.fromJson(response.data));
    } catch (e) {
      rethrow;
    }
  }

  Future<StoriesResponse> detail(String id) async {
    var dioCall = dioClientWithAuth.get(Endpoint.detail(id));

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => StoriesResponse.fromJson(response.data));
    } catch (e) {
      rethrow;
    }
  }
}
