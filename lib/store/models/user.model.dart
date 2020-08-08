class UserModel {
  UserModel({
    this.token,
    this.userId,
    this.login,
    this.error,
  });
  final String token;
  final String userId;
  final String login;
  final bool error;

  Map<String, dynamic> toMap(Map<String, dynamic> json) {
    return <String, dynamic>{
      'token': token,
      'userId': userId,
      'login': login,
      'error': error,
    };
  }

  // ignore: sort_constructors_first
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      token: json['token'].toString(),
      userId: json['userId'].toString(),
      login: json['login'].toString(),
      error: json['error'] as bool,
    );
  }

  // ignore: prefer_constructors_over_static_methods
  static UserModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    return UserModel(
        token: map['token'].toString(),
        userId: map['userId'].toString(),
        login: map['login'].toString(),
        error: map['error'] as bool);
  }
}
