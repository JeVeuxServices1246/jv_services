abstract class RegisterResourceResp {}

class RegisterSuccessResponse extends RegisterResourceResp {
  final String message;
  final String mailStatus;
  final int otp;
  final String token;
  final String tokenType;
  final int expiresIn;

  RegisterSuccessResponse({
    required this.message,
    required this.mailStatus,
    required this.otp,
    required this.token,
    required this.tokenType,
    required this.expiresIn,
  });

  factory RegisterSuccessResponse.fromJson(Map<String, dynamic> json) {
    return RegisterSuccessResponse(
        message: json['message'],
        mailStatus: json['mail_status'],
        otp: json['otp'],
        token: json['token'],
        tokenType: json['token_type'],
        expiresIn: json['expires_in']);
  }
}

class RegisterException extends RegisterResourceResp {
  final String exception;
  final int responseCode;

  RegisterException({required this.exception, required this.responseCode});
  factory RegisterException.fromJson(Map<String, dynamic> json) {
    return RegisterException(
      exception: json['exception'],
      responseCode: json['response_code'],
    );
  }
}

class Token {
  final Headers headers;
  final RegisterOriginal original;
  final dynamic exception;

  Token({
    required this.headers,
    required this.original,
    this.exception,
  });
  factory Token.fromJson(Map<String, dynamic> json) {
    return Token(
        headers: Headers(),
        original: RegisterOriginal.fromJson(json['original']));
  }
}

class Headers {
  Headers();
}

class RegisterOriginal {
  final String accessToken;
  final String tokenType;
  final int expiresIn;

  RegisterOriginal({
    required this.accessToken,
    required this.tokenType,
    required this.expiresIn,
  });
  factory RegisterOriginal.fromJson(Map<String, dynamic> json) {
    return RegisterOriginal(
        accessToken: json['access_token'],
        tokenType: json['token_type'],
        expiresIn: json['expires_in']);
  }
}

class RegisterBadResponse {
  final List<String>? username;
  final List<String>? phoneNumber;
  final List<String>? roleId;
  final List<String>? password;
  final List<String>? email;
  final List<String>? firstname;
  final List<String>? lastname;
  final List<String>? countryCode;

  RegisterBadResponse(
      {this.password,
      this.phoneNumber,
      this.roleId,
      this.username,
      this.email,
      this.firstname,
      this.lastname,
      this.countryCode});

  factory RegisterBadResponse.fromJson(Map<String, dynamic> json) {
    return RegisterBadResponse(
      phoneNumber: json['phone_number']
          ? (json['phone_number'] as List).map((e) => e.toString()).toList()
          : null,
      username: json['username']
          ? (json['username'] as List).map((e) => e.toString()).toList()
          : null,
      roleId: json['role_id']
          ? (json['role_id'] as List).map((e) => e.toString()).toList()
          : null,
      password: json['password']
          ? (json['password'] as List).map((e) => e.toString()).toList()
          : null,
      email: json['email']
          ? (json['email'] as List).map((e) => e.toString()).toList()
          : null,
      lastname: json['last_name']
          ? (json['last_name'] as List).map((e) => e.toString()).toList()
          : null,
      firstname: json['first_name']
          ? (json['first_name'] as List).map((e) => e.toString()).toList()
          : null,
      countryCode: json['country_code']
          ? (json['country_code'] as List).map((e) => e.toString()).toList()
          : null,
    );
  }
}
