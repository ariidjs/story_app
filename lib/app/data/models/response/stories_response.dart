import 'package:json_annotation/json_annotation.dart';

part 'stories_response.g.dart';

@JsonSerializable()
class StoriesResponse {
  bool? error;
  String? message;
  List<Story>? listStory;
  Story? story;

  StoriesResponse({this.error, this.message, this.listStory});

  factory StoriesResponse.fromJson(Map<String, dynamic> json) =>
      _$StoriesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$StoriesResponseToJson(this);
}

@JsonSerializable()
class Story {
  String? id;
  String? name;
  String? description;
  String? photoUrl;
  String? createdAt;
  double? lat;
  double? lon;

  Story(
      {this.id,
      this.name,
      this.description,
      this.photoUrl,
      this.createdAt,
      this.lat,
      this.lon});

  factory Story.fromJson(Map<String, dynamic> json) => _$StoryFromJson(json);

  Map<String, dynamic> toJson() => _$StoryToJson(this);
}
