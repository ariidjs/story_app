import 'package:json_annotation/json_annotation.dart';

part 'story_request.g.dart';

@JsonSerializable()
class StoryRequest {
  String? page;
  String? size;
  StoryRequest({
    this.page,
    this.size,
  });

  factory StoryRequest.fromJson(Map<String, dynamic> json) =>
      _$StoryRequestFromJson(json);

  Map<String, dynamic> toJson() => _$StoryRequestToJson(this);
}
