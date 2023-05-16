import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(const RegisterState()) {
    print("Register Bloc called");
    on<FirstNameChanged>(_firstnameEvent);
    on<LastNameChanged>(_lastnameEvent);
    on<EmailChanged>(_emailEvent);
    on<CountryCodeChanged>(_countryCodeEvent);
    on<PhoneChanged>(_phoneEvent);
    on<PasswordChanged>(_passwordEvent);
    on<ConfirmPasswordChanged>(_confirmPasswordEvent);
    on<PasswordVisibled>(_passwordVisibled);
    on<ConfirmPasswordVisibled>(_confirmPasswordVisibled);
    on<Register>(_registervent);
  }

  void _firstnameEvent(FirstNameChanged event, Emitter<RegisterState> emit) {
    print(event.firstname);
    emit(state.copy(firstname: event.firstname));
  }

  void _lastnameEvent(LastNameChanged event, Emitter<RegisterState> emit) {
    emit(state.copy(lastname: event.lastname));
  }

  void _emailEvent(EmailChanged event, Emitter<RegisterState> emit) {
    emit(state.copy(email: event.email));
  }

  void _countryCodeEvent(
      CountryCodeChanged event, Emitter<RegisterState> emit) {
    emit(state.copy(countryCode: event.countryCode));
  }

  void _phoneEvent(PhoneChanged event, Emitter<RegisterState> emit) {
    emit(state.copy(phone: event.phone));
  }

  void _passwordEvent(PasswordChanged event, Emitter<RegisterState> emit) {
    emit(state.copy(password: event.password));
  }

  void _confirmPasswordEvent(
      ConfirmPasswordChanged event, Emitter<RegisterState> emit) {
    emit(state.copy(confirmPassword: event.confirmPassword));
  }

  void _passwordVisibled(PasswordVisibled event, Emitter<RegisterState> emit) {
    emit(state.copy(pwdVisible: event.visible));
  }

  void _confirmPasswordVisibled(
      ConfirmPasswordVisibled event, Emitter<RegisterState> emit) {
    emit(state.copy(confirmPwdVisible: event.visible));
  }

  void _registervent(Register event, Emitter<RegisterState> emit) {}

  @override
  Future<void> close() {
    print("RegisterBloc closed");
    return super.close();
  }
}
