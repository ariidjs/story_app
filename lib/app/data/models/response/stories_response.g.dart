// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stories_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoriesResponse _$StoriesResponseFromJson(Map<String, dynamic> json) =>
    StoriesResponse(
      error: json['error'] as bool?,
      message: json['message'] as String?,
      listStory: (json['listStory'] as List<dynamic>?)
          ?.map((e) => Story.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..story = json['story'] == null
        ? null
        : Story.fromJson(json['story'] as Map<String, dynamic>);

Map<String, dynamic> _$StoriesResponseToJson(StoriesResponse instance) =>
    <String, dynamic>{
      'error': instance.error,
      'message': instance.message,
      'listStory': instance.listStory,
      'story': instance.story,
    };

Story _$StoryFromJson(Map<String, dynamic> json) => Story(
      id: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      photoUrl: json['photoUrl'] as String?,
      createdAt: json['createdAt'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$StoryToJson(Story instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'photoUrl': instance.photoUrl,
      'createdAt': instance.createdAt,
      'lat': instance.lat,
      'lon': instance.lon,
    };
