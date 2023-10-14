part of 'register_cubit.dart';

enum FormStatus { invalid, valid, validating, posting }

class RegisterFormState extends Equatable {
  final FormStatus formStatus;
  final bool isValid;
  final Username username;
  final Email email;
  final Password passaword;

  const RegisterFormState(
      {this.formStatus = FormStatus.invalid,
      this.isValid = false,
      this.username = const Username.pure(),
      this.email = const Email.pure(),
      this.passaword = const Password.pure()});

  RegisterFormState copyWith({
    FormStatus? formStatus,
    bool? isValid,
    Username? username,
    Email? email,
    Password? passaword,
  }) =>
      RegisterFormState(
          formStatus: formStatus ?? this.formStatus,
          isValid: isValid ?? this.isValid,
          username: username ?? this.username,
          email: email ?? this.email,
          passaword: passaword ?? this.passaword);

  @override
  List<Object> get props => [formStatus, isValid, username, email, passaword];
}
