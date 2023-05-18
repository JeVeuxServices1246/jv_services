class UserRegister {
  final String firstname;
  final String lastname;
  final String email;
  final String phone;
  final String countryCode;
  final String password;
  final int roleId;
  final String username;

  UserRegister(
      {required this.firstname,
      required this.roleId,
      required this.username,
      required this.lastname,
      required this.email,
      required this.phone,
      required this.countryCode,
      required this.password});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "first_name": firstname,
      "last_name": lastname,
      "phone_number": phone,
      "username": email,
      "password": password,
      "email": email,
      "role_id": roleId,
      "country_code": countryCode
    };
  }

  Map<String, String> headers() {
    return <String, String>{
      'Content-Type': 'application/json',
    };
  }
}
