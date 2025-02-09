class UserModel {
  final String? name;
  final String? email;
  final String? phone;
  final String? password;
  final String? type;

  UserModel({
    this.name,
    this.email,
    this.phone,
    this.password,
    this.type,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      password: json['password'],
      type: json['role'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'password': password,
      'role': type,
    };
  }
}
