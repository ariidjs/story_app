import 'package:json_annotation/json_annotation.dart';

part 'add_story_request.g.dart';

@JsonSerializable()
class AddStoryRequest {
  String desc;
  String photoPath;
  String? lat;
  String? long;
  AddStoryRequest({
    required this.desc,
    required this.photoPath,
    this.lat,
    this.long,
  });

  factory AddStoryRequest.fromJson(Map<String, dynamic> json) =>
      _$AddStoryRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AddStoryRequestToJson(this);
}
