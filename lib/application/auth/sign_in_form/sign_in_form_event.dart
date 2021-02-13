part of 'sign_in_form_bloc.dart';

@freezed
abstract class SignInFormEvent with _$SignInFormEvent {
  const factory SignInFormEvent.emailInput(String emailStr) = EmailInput;

  const factory SignInFormEvent.passwordInput(String passwordStr) =
      PasswordInput;

  const factory SignInFormEvent.registerWithEmailAndPasswordPressed() =
      RegisterWithEmailAndPasswordPressed;

  const factory SignInFormEvent.signInWithEmailAndPasswordPressed() =
      SignInWithEmailAndPasswordPressed;

  const factory SignInFormEvent.signInWithGooglePressed() =
      SignInWithGooglePressed;
}
