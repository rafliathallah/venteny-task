part of 'auth_login_bloc.dart';

sealed class AuthLoginState {}

class AuthLoginInitialState implements AuthLoginState {}

class AuthLoginLoadingState implements AuthLoginState {}

class AuthLoginSuccessState implements AuthLoginState {
  final AuthUserDto user;

  AuthLoginSuccessState({required this.user});
}

class AuthLoginFailedState implements AuthLoginState {
  final ErrorDto errorDto;
  AuthLoginFailedState({required this.errorDto});
}

