import 'dart:convert';

class AddStoryRequest {
  String desc;
  String photoPath;
  AddStoryRequest({
    required this.desc,
    required this.photoPath,
  });

  AddStoryRequest copyWith({
    String? desc,
    String? photoPath,
  }) {
    return AddStoryRequest(
      desc: desc ?? this.desc,
      photoPath: photoPath ?? this.photoPath,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'desc': desc,
      'photoPath': photoPath,
    };
  }

  factory AddStoryRequest.fromMap(Map<String, dynamic> map) {
    return AddStoryRequest(
      desc: map['desc'] as String,
      photoPath: map['photoPath'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddStoryRequest.fromJson(String source) =>
      AddStoryRequest.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'AddStoryRequest(desc: $desc, photoPath: $photoPath)';

  @override
  bool operator ==(covariant AddStoryRequest other) {
    if (identical(this, other)) return true;

    return other.desc == desc && other.photoPath == photoPath;
  }

  @override
  int get hashCode => desc.hashCode ^ photoPath.hashCode;
}
