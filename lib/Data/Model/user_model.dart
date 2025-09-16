class UserModel {
  final String token;

  UserModel({required this.token});

  // Factory constructor to create an object from JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      token: json['token'] ?? '',
    );
  }

  // Convert object to JSON
  Map<String, dynamic> toJson() {
    return {
      'token': token,
    };
  }
}
