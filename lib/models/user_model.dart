class UserModel {
  int? userId;
  int? countryCode;
  String? phoneNumber;
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  String? profilePic;
  bool? emailVerified;

  UserModel(
      {this.userId,
        this.countryCode,
        this.phoneNumber,
        this.username,
        this.firstName,
        this.lastName,
        this.email,
        this.profilePic,
        this.emailVerified});

  UserModel.fromJson(Map<dynamic, dynamic> json) {
    userId = json['user_id'];
    countryCode = json['country_code'];
    phoneNumber = json['phone_number'];
    username = json['username'];
    firstName = json['first_name'] ?? "";
    lastName = json['last_name'] ?? "";
    email = json['email'] ?? "";
    profilePic = json['profile_pic'] ?? "";
    emailVerified = json['email_verified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['country_code'] = countryCode;
    data['phone_number'] = phoneNumber;
    data['username'] = username;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['profile_pic'] = profilePic;
    data['email_verified'] = emailVerified;
    return data;
  }
}
