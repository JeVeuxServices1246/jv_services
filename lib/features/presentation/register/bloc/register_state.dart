part of 'register_bloc.dart';

class RegisterState {
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

  final Country? selectedCountry;
  final String? countryCodeError;

  final UserRegister? userRegister;

  final LoadingState loading;

  final RegisterSuccessResponse? registerSuccessResponse;

  final RegisterException? registerException;

  const RegisterState(
      {this.firstname = "",
      this.lastname = "",
      this.phone = "",
      this.confirmPassword = "",
      this.password = "",
      this.email = "",
      this.selectedCountry,
      this.pwdVisible = true,
      this.confirmPwdVisible = true,
      this.firstnameError,
      this.lastnameError,
      this.phoneError,
      this.emailError,
      this.passwordError,
      this.countryCodeError,
      this.confirmPasswordError,
      this.userRegister,
      this.loading = LoadingState.none,
      this.registerSuccessResponse,
      this.registerException});

  RegisterState copy({
    List<Country>? countries,
    String? firstname,
    String? lastname,
    String? phone,
    String? email,
    String? password,
    String? confirmPassword,
    Country? selectedCountry,
    bool? pwdVisible,
    bool? confirmPwdVisible,
    String? firstNameError,
    String? lastnameError,
    String? phoneError,
    String? emailError,
    String? passwordError,
    String? confirmPasswordError,
    String? countryCodeError,
    UserRegister? userRegister,
    LoadingState? loading,
    RegisterException? registerException,
    RegisterSuccessResponse? registerSuccessResponse,
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
        selectedCountry: selectedCountry ?? this.selectedCountry,
        countryCodeError: countryCodeError ??
            (selectedCountry == null ? this.countryCodeError : null),
        pwdVisible: pwdVisible ?? this.pwdVisible,
        confirmPwdVisible: confirmPwdVisible ?? this.confirmPwdVisible,
        userRegister: userRegister,
        loading: loading ?? LoadingState.none,
        registerSuccessResponse: registerSuccessResponse,
        registerException: registerException);
  }
}

// abstract class RegisterState extends Equatable {
//   const RegisterState();
  
//   @override
//   List<Object> get props => [];
// }

// class RegisterInitial extends RegisterState {}
