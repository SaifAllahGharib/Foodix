class SignupModel {
  final String name;
  final String email;
  final String phone_number;
  final String password;
  final String type;

  SignupModel({
    required this.name,
    required this.email,
    required this.phone_number,
    required this.password,
    required this.type,
  });

  factory SignupModel.fromJson(Map<String, dynamic> json) {
    return SignupModel(
      name: json['name'],
      email: json['email'],
      phone_number: json['phone_number'],
      password: json['password'],
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone_number': phone_number,
      'password': password,
      'type': type,
    };
  }
}
