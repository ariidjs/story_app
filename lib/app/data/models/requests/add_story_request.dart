// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

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

  AddStoryRequest copyWith({
    String? desc,
    String? photoPath,
    String? lat,
    String? long,
  }) {
    return AddStoryRequest(
      desc: desc ?? this.desc,
      photoPath: photoPath ?? this.photoPath,
      lat: lat ?? this.lat,
      long: long ?? this.long,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'desc': desc,
      'photoPath': photoPath,
      'lat': lat,
      'long': long,
    };
  }

  factory AddStoryRequest.fromMap(Map<String, dynamic> map) {
    return AddStoryRequest(
      desc: map['desc'] as String,
      photoPath: map['photoPath'] as String,
      lat: map['lat'] != null ? map['lat'] as String : null,
      long: map['long'] != null ? map['long'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddStoryRequest.fromJson(String source) =>
      AddStoryRequest.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AddStoryRequest(desc: $desc, photoPath: $photoPath, lat: $lat, long: $long)';
  }

  @override
  bool operator ==(covariant AddStoryRequest other) {
    if (identical(this, other)) return true;

    return other.desc == desc &&
        other.photoPath == photoPath &&
        other.lat == lat &&
        other.long == long;
  }

  @override
  int get hashCode {
    return desc.hashCode ^ photoPath.hashCode ^ lat.hashCode ^ long.hashCode;
  }
}
