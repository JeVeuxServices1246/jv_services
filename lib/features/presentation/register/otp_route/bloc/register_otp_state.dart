part of 'register_otp_bloc.dart';

class RegisterOtpState {
  final String time;
  final String otp;
  final RegisterSuccessResponse? registerSuccessResponse;
  final UserRegister? userRegister;
  final RegisterException? registerException;
  final LoadingState loading;

  const RegisterOtpState(
      {this.time = "",
      this.otp = "",
      this.registerSuccessResponse,
      this.userRegister,
      this.registerException,
      this.loading = LoadingState.none});

  RegisterOtpState copyWith({
    String? time,
    String? otp,
    RegisterSuccessResponse? registerSuccessResponse,
    UserRegister? userRegister,
    LoadingState? loading,
    RegisterException? registerException,
  }) {
    return RegisterOtpState(
        time: time ?? this.time,
        otp: otp ?? this.otp,
        registerSuccessResponse:
            registerSuccessResponse ?? this.registerSuccessResponse,
        userRegister: userRegister ?? this.userRegister,
        loading: loading ?? LoadingState.none,
        registerException: registerException);
  }
}
