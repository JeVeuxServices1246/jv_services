import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jv_services/features/data/data_source/register/register_ds.dart';
import 'package:jv_services/features/data/models/common/loading_state.dart';
import 'package:jv_services/features/data/models/register/register_resp.dart';
import 'package:jv_services/features/data/models/register/user_register_model.dart';

part 'register_otp_event.dart';
part 'register_otp_state.dart';

class RegisterOtpBloc extends Bloc<RegisterOtpEvent, RegisterOtpState> {
  final RegisterDS registerDS;
  late Timer _timer;
  int _start = 60;

  RegisterOtpBloc({required this.registerDS})
      : super(const RegisterOtpState()) {
    _startTimer();
    on<OTPNewTimeEvent>((event, emit) {
      emit(state.copyWith(time: event.time));
    });
    on<OTPNewOtpEvent>((event, emit) {
      emit(state.copyWith(otp: event.otp));
    });
    on<OTPUserRegisterEvent>((event, emit) {
      emit(state.copyWith(userRegister: event.userRegister));
    });
    on<OTPRegisterSuccessResponseEvent>((event, emit) {
      emit(state.copyWith(
          registerSuccessResponse: event.registerSuccessResponse));
    });
    on<OTPResendOtpEvent>(_resendOtpEvent);

    on<OTPVerifyEvent>(_verifyOtp);

    // on<OTPNewOtpEvent>((event, emit) {});
  }

  void _verifyOtp(OTPVerifyEvent event, Emitter<RegisterOtpState> emit) async {
    if (state.registerSuccessResponse == null) {
      emit(state.copyWith(
          registerException: RegisterException(
              exception: "Something went wrong re-send OTP again",
              responseCode: 0)));
      return;
    }
    if (state.registerSuccessResponse!.otp.toString() == state.otp) {
      emit(state.copyWith(loading: LoadingState.show));

      return;
    }
    emit(state.copyWith(
        registerException: RegisterException(
            exception: "OTP Does not match", responseCode: 0)));
  }

  void _resendOtpEvent(
      OTPResendOtpEvent event, Emitter<RegisterOtpState> emit) async {
    emit(state.copyWith(loading: LoadingState.show));
    final RegisterResourceResp response =
        await registerDS.registerUser(state.userRegister!);
    emit(state.copyWith(loading: LoadingState.hide));
    if (response is RegisterSuccessResponse) {
      emit(state.copyWith(registerSuccessResponse: response));
      _timer.cancel();
      _start = 60;
      _startTimer();
    } else if (response is RegisterException) {
      emit(state.copyWith(registerException: response));
    }
  }

  void _startTimer() {
    const Duration oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (timer) {
      if (_start == 0) {
        _timer.cancel();
        return;
      }
      _start--;
      final String theTime = _start <= 9 ? "0$_start" : _start.toString();
      add(OTPNewTimeEvent(time: "00:$theTime"));
    });
  }

  @override
  Future<void> close() {
    _timer.cancel();
    return super.close();
  }
}
