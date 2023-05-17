part of 'register_bloc.dart';

class RegisterState extends Equatable {
  final String firstname;
  final String? firstnameError;

  final String lastname;
  final String? lastnameError;

  final String phone;
  final String? phoneError;

  final String email;
  final String? emailError;

  final String password;
  final String? passwordError;
  final bool pwdVisible;

  final String confirmPassword;
  final String? confirmPasswordError;
  final bool confirmPwdVisible;

  final String countryCode;
  final String? countryCodeError;

  const RegisterState(
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
    List<Country>? countries,
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
      firstname: firstname ?? this.firstname,
      firstnameError:
          firstNameError ?? (firstname == null ? firstnameError : null),
      lastname: lastname ?? this.lastname,
      lastnameError:
          lastnameError ?? (lastname == null ? this.lastnameError : null),
      phone: phone ?? this.phone,
      phoneError: phoneError ?? (phone == null ? this.phoneError : null),
      email: email ?? this.email,
      emailError: emailError ?? (email == null ? this.emailError : null),
      password: password ?? this.password,
      passwordError:
          passwordError ?? (password == null ? this.passwordError : null),
      confirmPassword: confirmPassword ?? this.confirmPassword,
      confirmPasswordError: confirmPasswordError ??
          (confirmPassword == null ? this.confirmPasswordError : null),
      countryCode: countryCode ?? this.countryCode,
      countryCodeError: countryCodeError ??
          (countryCode == null ? this.countryCodeError : null),
      pwdVisible: pwdVisible ?? this.pwdVisible,
      confirmPwdVisible: confirmPwdVisible ?? this.confirmPwdVisible,
    );
  }

  @override
  List<Object> get props => [
        lastname,
        firstname,
        email,
        password,
        phone,
        confirmPassword,
        countryCode,
        confirmPwdVisible,
        pwdVisible
      ];
}

// abstract class RegisterState extends Equatable {
//   const RegisterState();
  
//   @override
//   List<Object> get props => [];
// }

// class RegisterInitial extends RegisterState {}
