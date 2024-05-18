import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

class ValidationUtils {
  ValidationUtils._();

  static const usernameRegex = r'^[^\s]+$';
  static const nameRegex = r'^[aA-zZ\u0621-\u064A\s]+$';

  static final usernameInputFormatters = [
    LengthLimitingTextInputFormatter(191),
  ];
  static final emailInputFormatters = [
    LengthLimitingTextInputFormatter(40),
  ];
  static final passwordInputFormatters = [
    LengthLimitingTextInputFormatter(191),
  ];

  static FormFieldValidator<String> getPhoneValidation(
      [BuildContext? context, String? locale]) {
    return Validators.compose([
      Validators.required(
          context == null ? '' : _getTranslatedText('phone_message', locale)),
    ]);
  }

  static FormFieldValidator<String> getNameValidation(
      [BuildContext? context, String? locale]) {
    return Validators.compose([
      Validators.required(
          context == null ? '' : _getTranslatedText('name_message', locale)),
    ]);
  }

  static FormFieldValidator<String> getCodeValidation(
      [BuildContext? context, String? locale]) {
    return Validators.compose([
      Validators.required(
          context == null ? '' : _getTranslatedText('code_message', locale)),
    ]);
  }

  static FormFieldValidator<String> getEmailValidation(
      [BuildContext? context, String? locale]) {
    return Validators.compose([
      Validators.required(
          context == null ? '' : _getTranslatedText('email_message', locale)),
      Validators.email(context == null
          ? ''
          : _getTranslatedText('email_valid_message', locale)),
    ]);
  }

  static FormFieldValidator<String> getPasswordValidation(
      [BuildContext? context, String? locale, int? length]) {
    length = length ?? 6;
    return Validators.compose([
      Validators.required(context == null
          ? ''
          : _getTranslatedText('password_message', locale)),
      Validators.minLength(
          length,
          context == null
              ? ''
              : _getTranslatedText('password_length_message', locale,
                  additionalValue: length)),
    ]);
  }

  static FormFieldValidator<String> getConfirmPasswordValidation(password,
      [BuildContext? context, String? locale, int? length]) {
    length = length ?? 6;
    return Validators.compose([
      matchpassword(password, locale),
      Validators.required(context == null
          ? ''
          : _getTranslatedText('confirm_password_message', locale)),
      Validators.minLength(
          length,
          context == null
              ? ''
              : _getTranslatedText('password_length_message', locale,
                  additionalValue: length)),
    ]);
  }

  static matchpassword(password, locale) {
    return (String? value) {
      if (value == null) {
        value = '';
      }
      if (value != password)
        return _getTranslatedText('password_notmatch_message', locale);
      else
        return null;
    };
  }

  static FormFieldValidator<String> getDateValidation([BuildContext? context]) {
    return Validators.compose([
      Validators.required(context == null ? '' : 'Date is required'),
    ]);
  }

  static FormFieldValidator<String> getVerificationCodeValidation(
      [BuildContext? context, String? locale]) {
    return Validators.compose([
      Validators.required(
          context == null ? '' : _getTranslatedText('code_message', locale)),
      Validators.minLength(
          4,
          context == null
              ? ''
              : 'Code lenght need to be 4 charachters or more'),
    ]);
  }

  static FormFieldValidator<String> getCustomValidation(field,
      [BuildContext? context, String? locale]) {
    return Validators.compose([
      Validators.required(context == null
          ? ''
          : '$field ${_getTranslatedText('is_required', locale)}'),
    ]);
  }

  static FormFieldValidator<String> getCustomRegexValidation(field,
      [BuildContext? context, String? locale]) {
    return Validators.compose([
      Validators.required(context == null
          ? ''
          : '$field ${_getTranslatedText('is_required', locale)}'),
      Validators.patternRegExp(RegExp(nameRegex),
          context == null ? '' : _getTranslatedText('alphabe_regex', locale))
    ]);
  }

  static String _getTranslatedText(String text, locale, {additionalValue}) {
    switch (text) {
      case "phone_message":
        if (locale == 'ar') {
          return "الهاتف مطلوب";
        }
        return "Phone is required";

      case 'name_message':
        if (locale == 'ar') {
          return 'حقل الاسم مطلوب';
        }
        return 'Name is required';

      case 'code_message':
        if (locale == 'ar') {
          return 'الرمز مطلوب';
        }
        return 'Code is required';

      case 'email_message':
        if (locale == 'ar') {
          return 'البريد الالكتروني مطلوب';
        }
        return 'Email is required';

      case 'email_valid_message':
        if (locale == 'ar') {
          return 'البريد الإلكتروني ليس بريدًا إلكترونيًا صالحًا';
        }
        return 'Email is not valid email';

      case 'password_message':
        if (locale == 'ar') {
          return 'كلمة المرور مطلوبة';
        }
        return 'Password is required';

      case 'password_length_message':
        if (locale == 'ar') {
          return 'يجب أن تتكون كلمة المرور من $additionalValue أحرف أو أكثر';
        }
        return 'Password lenght need to be $additionalValue charachters or more';

      case 'confirm_password_message':
        if (locale == 'ar') {
          return 'تأكيد كلمة المرور مطلوب';
        }
        return 'Confirm Password is required';
      case 'password_notmatch_message':
        if (locale == 'ar') {
          return 'كلمة السر غير مطابقة';
        }
        return 'password do not match';

      case 'is_required':
        if (locale == 'ar') {
          return 'مطلوب';
        }
        return 'is required';

      case 'alphabe_regex':
        if (locale == 'ar') {
          return 'يسمح فقط الحروف الهجائية لهذا الحقل';
        }
        return 'Only alphabets are allowed for this field';
    }
    return '';
  }
}
