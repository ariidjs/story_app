import 'dart:convert';

class SignInRequest {
  String email;
  String password;
  SignInRequest({
    required this.email,
    required this.password,
  });

  SignInRequest copyWith({
    String? email,
    String? password,
  }) {
    return SignInRequest(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
    };
  }

  factory SignInRequest.fromMap(Map<String, dynamic> map) {
    return SignInRequest(
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SignInRequest.fromJson(String source) =>
      SignInRequest.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'SignInRequest(email: $email, password: $password)';

  @override
  bool operator ==(covariant SignInRequest other) {
    if (identical(this, other)) return true;

    return other.email == email && other.password == password;
  }

  @override
  int get hashCode => email.hashCode ^ password.hashCode;
}
