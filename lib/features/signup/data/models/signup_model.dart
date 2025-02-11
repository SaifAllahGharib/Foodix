class SignupModel {
  final String name;
  final String email;
  final String phone;
  final String password;
  final String type;

  SignupModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    required this.type,
  });

  factory SignupModel.fromJson(Map<String, dynamic> json) {
    return SignupModel(
      name: json['name'],
      email: json['email'],
      phone: json['phone_number'],
      password: json['password'],
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone_number': phone,
      'password': password,
      'type': type,
    };
  }
}
