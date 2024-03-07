import 'dart:convert';

class StoryRequest {
  String? page;
  String? size;
  StoryRequest({
    this.page,
    this.size,
  });

  StoryRequest copyWith({
    String? page,
    String? size,
  }) {
    return StoryRequest(
      page: page ?? this.page,
      size: size ?? this.size,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'page': page,
      'size': size,
    };
  }

  factory StoryRequest.fromMap(Map<String, dynamic> map) {
    return StoryRequest(
      page: map['page'] != null ? map['page'] as String : null,
      size: map['size'] != null ? map['size'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory StoryRequest.fromJson(String source) =>
      StoryRequest.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'StoryRequest(page: $page, size: $size)';

  @override
  bool operator ==(covariant StoryRequest other) {
    if (identical(this, other)) return true;

    return other.page == page && other.size == size;
  }

  @override
  int get hashCode => page.hashCode ^ size.hashCode;
}
