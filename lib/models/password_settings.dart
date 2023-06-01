import 'package:passlum/enums/password_type.dart';

class PasswordSettings {
  static final PasswordSettings _instance = PasswordSettings._internal();

  PasswordType _type = PasswordType.allCharacters;
  bool _isUppercase = true;
  bool _isLowercase = true;
  bool _isNumeric = false;
  bool _isSymbolic = false;

  factory PasswordSettings() {
    return _instance;
  }

  PasswordSettings._internal();

  PasswordType get type => _type;
  set type(PasswordType value) => _type = value;

  bool get isUppercase => _isUppercase;
  set isUppercase(bool value) => _isUppercase = value;

  bool get isLowercase => _isLowercase;
  set isLowercase(bool value) => _isLowercase = value;

  bool get isNumeric => _isNumeric;
  set isNumeric(bool value) => _isNumeric = value;

  bool get isSymbolic => _isSymbolic;
  set isSymbolic(bool value) => _isSymbolic = value;
}