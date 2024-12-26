part of 'auth_login_bloc.dart';

abstract class AuthLoginEvent extends Equatable {
  const AuthLoginEvent();
}

class AuthLoginProceedEvent extends AuthLoginEvent {
  final String email;
  final String password;

  const AuthLoginProceedEvent({
    required this.email,
    required this.password,
  });
  @override
  List<Object?> get props => [email,password];
}
class WithBiometricEvent extends AuthLoginEvent{
  @override
  List<Object?> get props => [];

}
class GoogleLoginEvent extends AuthLoginEvent{
  @override
  List<Object?> get props => [];

}

