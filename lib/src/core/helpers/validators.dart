
import 'package:wallpaper_app/src/core/errors/messages.dart';
import 'package:wallpaper_app/src/core/extensions/string_extension.dart';

class Validators {
  static String? emptyValidator(value) {
    if (value.toString().isEmpty) {
      return Message.emptyField;
    }
    return null;
  }

  static String? emailValidator(value) {
    if (value.toString().isEmpty) {
      return Message.emptyEmail;
    } else if (!value.toString().isValidEmail) {
      return Message.invalidEmail;
    }
    return null;
  }

  static String? phoneNumberValidator(value) {
    if (value.toString().isEmpty) {
      return Message.emptyPhone;
    } else if (!value.toString().isValidPhone) {
      return Message.invalidPhone;
    }
    return null;
  }

  static String? passwordValidator(value) {
    if (value.toString().isEmpty) {
      return Message.emptyPassword;
    } else if (value.toString().length < 6) {
      return Message.invalidPassword;
    }
    return null;
  }

  static String? otpValidator(value) {
    if (value.toString().isEmpty) {
      return Message.emptyOTP;
    } else if (value.toString().length != 6) {
      return Message.invalidOTP;
    }
    return null;
  }
}
