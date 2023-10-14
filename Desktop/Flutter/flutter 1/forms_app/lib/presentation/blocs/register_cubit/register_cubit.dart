// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:forms_app/Infraestructure/imputs/imputs.dart';
import 'package:forms_app/Infraestructure/imputs/passaword.dart';
import 'package:forms_app/Infraestructure/imputs/username.dart';
import 'package:formz/formz.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterFormState> {
  RegisterCubit() : super(const RegisterFormState());
  void onSubmit() {
    emit(state.copyWith(
        formStatus: FormStatus.validating,
        username: Username.dirty(state.username.value),
        passaword: Password.dirty(state.passaword.value),
        email: Email.dirty(state.email.value),
        isValid: Formz.validate([
          state.username,
          state.passaword,
          state.email,
        ])));

    print('Submit $state');
  }

  void userNameChanged(String value) {
    final username = Username.dirty(value);

    emit(state.copyWith(
        username: username,
        isValid: Formz.validate([username, state.passaword, state.email])));
  }

  void emailChanged(String value) {
    final email = Email.dirty(value);

    emit(state.copyWith(
        email: email,
        isValid: Formz.validate([email, state.passaword, state.username])));
  }

  void passawordChanged(String value) {
    final passaword = Password.dirty(value);

    emit(state.copyWith(
      passaword: passaword,
      isValid: Formz.validate([passaword, state.username, state.email]),
    ));
  }
}
