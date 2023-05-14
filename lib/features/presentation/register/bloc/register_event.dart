part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();
}

class FirstNameChanged extends RegisterEvent {
  final String firstname;

  const FirstNameChanged(this.firstname);

  @override
  List<Object> get props => [firstname];
}

class LastNameChanged extends RegisterEvent {
  final String lastname;

  const LastNameChanged(this.lastname);

  @override
  List<Object> get props => [lastname];
}

class EmailChanged extends RegisterEvent {
  final String email;

  const EmailChanged(this.email);

  @override
  List<Object> get props => [email];
}

class CountryCodeChanged extends RegisterEvent {
  final String countryCode;

  const CountryCodeChanged(this.countryCode);

  @override
  List<Object> get props => [countryCode];
}

class PhoneChanged extends RegisterEvent {
  final String phone;

  const PhoneChanged(this.phone);

  @override
  List<Object> get props => [phone];
}

class PasswordChanged extends RegisterEvent {
  final String password;

  const PasswordChanged(this.password);

  @override
  List<Object> get props => [password];
}

class ConfirmPasswordChanged extends RegisterEvent {
  final String confirmPassword;

  const ConfirmPasswordChanged(this.confirmPassword);

  @override
  List<Object> get props => [confirmPassword];
}

class Register extends RegisterEvent {
  @override
  List<Object> get props => [];
}

class PasswordVisibled extends RegisterEvent {
  final bool visible;

  const PasswordVisibled(this.visible);
  @override
  List<Object> get props => [visible];
}

class ConfirmPasswordVisibled extends RegisterEvent {
  final bool visible;

  const ConfirmPasswordVisibled(this.visible);
  @override
  List<Object> get props => [visible];
}
