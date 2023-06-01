import 'dart:math';

import 'package:passlum/enums/password_type.dart';
import 'package:passlum/models/password_lenght.dart';
import 'package:passlum/models/password_settings.dart';

class PasswordGenerator {
  static final PasswordGenerator _instance = PasswordGenerator._();

  factory PasswordGenerator() {
    return _instance;
  }

  PasswordGenerator._(){
    _password = generate();
  }

  final String _smallLetters = "abcdefghijklmnopqrstuvwxyz";
  final String _capitalLetters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
  final String _numbers = "0123456789";
  final String _symbols = "!@#\$%^&*()_-+=/?";

  late String _password;
  String get password => _password;


  String _generateEasyToSayPassword(int lenght){
    String password = "";
    String allowedCharacters = "";
    
    if(PasswordSettings().isUppercase) allowedCharacters += _capitalLetters;
    if(PasswordSettings().isLowercase) allowedCharacters += _smallLetters;

    for (var i = 0; i < lenght; i++) {
      password += allowedCharacters[Random().nextInt(allowedCharacters.length - 1)];
    }

    return password;
  }

  String _generateEasyToReadPassword(int lenght){
    String password = "";
    String allowedCharacters = "";
    String bannedCharacters = "0oO1lLiI";

    if(PasswordSettings().isUppercase) allowedCharacters += _capitalLetters;
    if(PasswordSettings().isLowercase) allowedCharacters += _smallLetters;
    if(PasswordSettings().isNumeric) allowedCharacters += _numbers;
    if(PasswordSettings().isSymbolic) allowedCharacters += _symbols;

    for (var i = 0; i < bannedCharacters.length; i++) {
      allowedCharacters = allowedCharacters.replaceAll(bannedCharacters[i], '');
    }

    for (var i = 0; i < lenght; i++) {
      password += allowedCharacters[Random().nextInt(allowedCharacters.length - 1)];
    }

    return password;
  } 

  String _generateAllCharactersPassword(int lenght){
    String password = "";
    String allowedCharacters = "";

    if(PasswordSettings().isUppercase) allowedCharacters += _capitalLetters;
    if(PasswordSettings().isLowercase) allowedCharacters += _smallLetters;
    if(PasswordSettings().isNumeric) allowedCharacters += _numbers;
    if(PasswordSettings().isSymbolic) allowedCharacters += _symbols;

    for (var i = 0; i < lenght; i++) {
      password += allowedCharacters[Random().nextInt(allowedCharacters.length - 1)];
    }

    return password;
  } 

  String generate(){
    int lenght = PasswordLength().passwordLength;

    switch (PasswordSettings().type) {
      case PasswordType.easyToSay:
        _password = _generateEasyToSayPassword(lenght);
        return _password;
      case PasswordType.easyToRead:
        _password =  _generateEasyToReadPassword(lenght);
        return _password;
      case PasswordType.allCharacters:
        _password =  _generateAllCharactersPassword(lenght);
        return _password;
    }
  }
}