//Singleton pattern
class PasswordLength {
  static final PasswordLength _instance = PasswordLength._internal();

  factory PasswordLength() {
    return _instance;
  }

  PasswordLength._internal();

  int _passwordLength = 12;

  int get passwordLength => _passwordLength;

  set passwordLength(int length) {
    _passwordLength = length;
  }
}
