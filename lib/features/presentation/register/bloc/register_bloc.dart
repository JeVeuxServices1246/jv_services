import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jv_services/features/data/data_source/common/country_ds.dart';
import 'package:jv_services/features/data/data_source/register/register_ds.dart';
import 'package:jv_services/features/data/models/common/country.dart';
import 'package:jv_services/features/domain/usecases/register_form_validation.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterDS registerDS;
  final RegisterFormValidation registerFormValidation;

  RegisterBloc({required this.registerDS, required this.registerFormValidation})
      : super(const RegisterState()) {
    on<LoadCountries>(_loadCountries);
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

  void _loadCountries(LoadCountries event, Emitter<RegisterState> emit) {
    emit(state.copy(countries: event.countries));
  }

  void _firstnameEvent(FirstNameChanged event, Emitter<RegisterState> emit) {
    emit(state.copy(
        firstname: event.firstname,
        firstNameError:
            registerFormValidation.firstnameValidation(event.firstname)));
  }

  void _lastnameEvent(LastNameChanged event, Emitter<RegisterState> emit) {
    emit(state.copy(
        lastname: event.lastname,
        lastnameError:
            registerFormValidation.lastnameValidation(event.lastname)));
  }

  void _emailEvent(EmailChanged event, Emitter<RegisterState> emit) {
    emit(state.copy(
        email: event.email,
        emailError: registerFormValidation.validateEmailAddress(event.email)));
  }

  void _countryCodeEvent(
      CountryCodeChanged event, Emitter<RegisterState> emit) {
    emit(state.copy(countryCode: event.countryCode));
  }

  void _phoneEvent(PhoneChanged event, Emitter<RegisterState> emit) {
    emit(state.copy(
        phone: event.phone,
        phoneError: registerFormValidation.phoneValidation(event.phone)));
  }

  void _passwordEvent(PasswordChanged event, Emitter<RegisterState> emit) {
    emit(state.copy(
        password: event.password,
        passwordError:
            registerFormValidation.passwordValidation(event.password)));
  }

  void _confirmPasswordEvent(
      ConfirmPasswordChanged event, Emitter<RegisterState> emit) {
    emit(state.copy(confirmPassword: event.confirmPassword));
  }

  void _passwordVisibled(PasswordVisibled event, Emitter<RegisterState> emit) {
    print(event.visible.toString());
    emit(state.copy(pwdVisible: event.visible));
  }

  void _confirmPasswordVisibled(
      ConfirmPasswordVisibled event, Emitter<RegisterState> emit) {
    emit(state.copy(confirmPwdVisible: event.visible));
  }

  void _registervent(Register event, Emitter<RegisterState> emit) {
    print("firstname: ${state.firstname}");
    print("lastname: ${state.lastname}");
    print("email: ${state.email}");
    print("phone: ${state.phone}");
    print("password: ${state.password}");
  }

  @override
  Future<void> close() {
    print("RegisterBloc closed");
    return super.close();
  }
}
