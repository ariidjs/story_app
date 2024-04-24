// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_story_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddStoryRequest _$AddStoryRequestFromJson(Map<String, dynamic> json) =>
    AddStoryRequest(
      desc: json['desc'] as String,
      photoPath: json['photoPath'] as String,
      lat: json['lat'] as String?,
      long: json['long'] as String?,
    );

Map<String, dynamic> _$AddStoryRequestToJson(AddStoryRequest instance) =>
    <String, dynamic>{
      'desc': instance.desc,
      'photoPath': instance.photoPath,
      'lat': instance.lat,
      'long': instance.long,
    };
