abstract class RegisterFormValidation {
  bool isFieldEmpty(String? value);
  String? validateEmailAddress(String? email);
  String? passwordValidation(String? password);
  String? phoneValidation(String? phone);
  String? firstnameValidation(String? name);
  String? lastnameValidation(String? name);
}

class RegisterFormValidationImpl implements RegisterFormValidation {
  final RegExp phoneNumberRegex = RegExp(
      r'^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$');
  final RegExp emailRegex = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  final RegExp passwordRegex =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  final RegExp nameRegExp = RegExp(r'^[a-z A-Z]+$');

  @override
  bool isFieldEmpty(String? value) => value?.isEmpty ?? true;

  @override
  String? validateEmailAddress(String? email) {
    if (email == null) {
      return "Email should not be blank";
    }
    if (!emailRegex.hasMatch(email)) {
      return "Enter valid email address";
    }
    return null;
  }

  @override
  String? passwordValidation(String? password) {
    if (password == null) {
      return "Password should not be blank";
    }
    if (password.length < 7) {
      return "Password minimum contains 8 char";
    }
    if (!passwordRegex.hasMatch(password)) {
      return "Enter valid password";
    }
    return null;
  }

  @override
  String? phoneValidation(String? phone) {
    if (phone == null) {
      return "phone should not be blank";
    }
    if (!phoneNumberRegex.hasMatch(phone)) {
      return "Please Enter a Valid Phone Number";
    }
    return null;
  }

  @override
  String? firstnameValidation(String? name) {
    if (name == null) {
      return "First name should be blank";
    }
    if (name.length < 3) {
      return "Enter atleast 3 characters";
    }
    if (!nameRegExp.hasMatch(name)) {
      return "Invalid characters are not allowed! We dont allow special chars and numbers";
    }
    return null;
  }

  @override
  String? lastnameValidation(String? name) {
    if (name == null) {
      return "Last name should be blank";
    }
    if (name.length < 3) {
      return "Enter atleast 3 characters";
    }
    if (!nameRegExp.hasMatch(name)) {
      return "Invalid characters found! We dont allow special chars and numbers";
    }

    return null;
  }
}
