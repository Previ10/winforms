import 'package:formz/formz.dart';

// Define input validation errors
enum PassawordError { empty, length, reu }

// Extend FormzInput and provide the input type and error type.
class Password extends FormzInput<String, PassawordError> {
  // Call super.pure to represent an unmodified form input.
  const Password.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const Password.dirty(String value) : super.dirty(value);
  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == PassawordError.empty) return 'El campo es requerido';
    if (displayError == PassawordError.length) return 'Mínimo 6 caracteres';

    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  PassawordError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return PassawordError.empty;
    if (value.length > 6) return PassawordError.length;
    return null;
  }
}
