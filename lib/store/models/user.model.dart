class UserModel {
  UserModel({
    this.accessToken,
    this.id,
    this.login,
    this.email
    // this.error,
  });
  final String accessToken;
  final String id;
  final String login;
  final String email;
  // final bool error;

  Map<String, dynamic> toMap(Map<String, dynamic> json) {
    return <String, dynamic>{
      'accessToken':accessToken,
      'id':id,
      'login':login,
      'email':email
      // 'error': error,
    };
  }

  // ignore: sort_constructors_first
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      accessToken:json['accessToken'].toString(),
      id:json['id'].toString(),
      login:json['login'].toString(),
      email:json['email'].toString()
      // error: json['error'] as bool,
    );
  }

  // ignore: prefer_constructors_over_static_methods
  static UserModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    return UserModel(
        accessToken:map['accessToken'].toString(),
        id:map['id'].toString(),
        login:map['login'].toString(),
        email:map['email'].toString()
        // error: map['error'] as bool
        );
  }
}
