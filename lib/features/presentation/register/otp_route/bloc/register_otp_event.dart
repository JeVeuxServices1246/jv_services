part of 'register_otp_bloc.dart';

abstract class RegisterOtpEvent extends Equatable {
  const RegisterOtpEvent();
}

class OTPNewTimeEvent extends RegisterOtpEvent {
  final String time;

  const OTPNewTimeEvent({required this.time});

  @override
  List<Object> get props => [time];
}

class OTPNewOtpEvent extends RegisterOtpEvent {
  final String otp;

  const OTPNewOtpEvent({required this.otp});

  @override
  List<Object> get props => [otp];
}

class OTPUserRegisterEvent extends RegisterOtpEvent {
  final UserRegister userRegister;

  const OTPUserRegisterEvent({required this.userRegister});

  @override
  List<Object> get props => [userRegister];
}

class OTPRegisterSuccessResponseEvent extends RegisterOtpEvent {
  final RegisterSuccessResponse registerSuccessResponse;

  const OTPRegisterSuccessResponseEvent(
      {required this.registerSuccessResponse});

  @override
  List<Object> get props => [registerSuccessResponse];
}

class OTPResendOtpEvent extends RegisterOtpEvent {
  final UserRegister userRegister;

  const OTPResendOtpEvent({required this.userRegister});

  @override
  List<Object> get props => [userRegister];
}

class OTPVerifyEvent extends RegisterOtpEvent {
  const OTPVerifyEvent();

  @override
  List<Object> get props => [];
}
