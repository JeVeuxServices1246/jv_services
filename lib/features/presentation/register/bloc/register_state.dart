part of 'register_bloc.dart';

class RegisterState {
  String firstname;
  String? firstnameError;
  String lastname;
  String? lastnameError;
  String phone;
  String? phoneError;
  String email;
  String? emailError;

  String password;
  String? passwordError;
  bool pwdVisible;

  String confirmPassword;
  String? confirmPasswordError;

  bool confirmPwdVisible;
  String countryCode;
  String? countryCodeError;

  RegisterState(
      {this.firstname = "",
      this.lastname = "",
      this.phone = "",
      this.confirmPassword = "",
      this.password = "",
      this.email = "",
      this.countryCode = "",
      this.pwdVisible = true,
      this.confirmPwdVisible = true,
      this.firstnameError,
      this.lastnameError,
      this.phoneError,
      this.emailError,
      this.passwordError,
      this.countryCodeError,
      this.confirmPasswordError});

  RegisterState copy({
    String? firstname,
    String? lastname,
    String? phone,
    String? email,
    String? password,
    String? confirmPassword,
    String? countryCode,
    bool? pwdVisible,
    bool? confirmPwdVisible,
    String? firstNameError,
    String? lastnameError,
    String? phoneError,
    String? emailError,
    String? passwordError,
    String? confirmPasswordError,
    String? countryCodeError,
  }) {
    return RegisterState(
        confirmPassword: confirmPassword ?? this.confirmPassword,
        firstname: firstname ?? this.firstname,
        lastname: lastname ?? this.lastname,
        phone: phone ?? this.phone,
        email: email ?? this.email,
        password: password ?? this.password,
        countryCode: countryCode ?? this.countryCode,
        confirmPwdVisible: confirmPwdVisible ?? this.confirmPwdVisible,
        pwdVisible: pwdVisible ?? this.pwdVisible,
        firstnameError: firstNameError ?? firstnameError,
        lastnameError: lastnameError ?? this.lastnameError,
        emailError: emailError ?? this.emailError,
        passwordError: passwordError ?? this.passwordError,
        countryCodeError: confirmPassword ?? this.countryCodeError,
        confirmPasswordError: confirmPasswordError ?? this.confirmPasswordError,
        phoneError: phoneError ?? this.phoneError);
  }
}

// abstract class RegisterState extends Equatable {
//   const RegisterState();
  
//   @override
//   List<Object> get props => [];
// }

// class RegisterInitial extends RegisterState {}
