bool isValidPhone(String phone) {
  final phoneRegex = RegExp(r"^\d{10,15}$");
  return phoneRegex.hasMatch(phone);
}
