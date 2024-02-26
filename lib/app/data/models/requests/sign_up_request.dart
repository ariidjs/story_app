// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SignUpRequest {
  String name;
  String email;
  String password;
  SignUpRequest({
    required this.name,
    required this.email,
    required this.password,
  });

  SignUpRequest copyWith({
    String? name,
    String? email,
    String? password,
  }) {
    return SignUpRequest(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'password': password,
    };
  }

  factory SignUpRequest.fromMap(Map<String, dynamic> map) {
    return SignUpRequest(
      name: map['name'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SignUpRequest.fromJson(String source) =>
      SignUpRequest.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'SignUpRequest(name: $name, email: $email, password: $password)';

  @override
  bool operator ==(covariant SignUpRequest other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.email == email &&
        other.password == password;
  }

  @override
  int get hashCode => name.hashCode ^ email.hashCode ^ password.hashCode;
}
