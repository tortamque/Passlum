import 'dart:math';

import 'package:passlum/enums/password_type.dart';
import 'package:passlum/models/password_settings.dart';

class PasswordGenerator {
  static final PasswordGenerator _instance = PasswordGenerator._();

  factory PasswordGenerator() {
    return _instance;
  }

  PasswordGenerator._();

  final String _smallLetters = "abcdefghijklmnopqrstuvwxyz";
  final String _capitalLetters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
  final String _numbers = "0123456789";
  final String _symbols = "!@#\$%^&*()_-+=/?";

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

  String generate(int lenght){
    switch (PasswordSettings().type) {
      case PasswordType.easyToSay:
        return _generateEasyToSayPassword(lenght);
      case PasswordType.easyToRead:
        return _generateEasyToReadPassword(lenght);
      case PasswordType.allCharacters:
        return _generateAllCharactersPassword(lenght);
    }
  }
}