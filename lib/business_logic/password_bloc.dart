import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:passlum/models/password_generator.dart';

class PasswordBloc extends Bloc<PasswordChangeEvent, String>{
  PasswordBloc() : super(PasswordGenerator().password){
    on<PasswordChangeEvent>(_onPasswordChange);
  }

  _onPasswordChange(PasswordChangeEvent event, Emitter<String> emit){
    emit(PasswordGenerator().password);
  }
}

class PasswordChangeEvent{}