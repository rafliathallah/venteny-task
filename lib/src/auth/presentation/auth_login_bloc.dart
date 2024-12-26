import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../core/data/local/app_preferences.dart';
import '../../../core/domain/models/error_dto.dart';
import '../data/remote/request/auth_login_request.dart';
import '../domain/models/auth_user_dto.dart';
import '../domain/usecases/auth_login_usecase.dart';

part 'auth_login_event.dart';
part 'auth_login_state.dart';

@injectable
class AuthLoginBloc extends Bloc<AuthLoginEvent, AuthLoginState> {
  final AuthLoginUseCase authLoginUseCase;
  final AppPreferences preferences;

  AuthLoginBloc({required this.authLoginUseCase, required this.preferences})
      : super(AuthLoginInitialState()) {
    on<AuthLoginProceedEvent>(_onLoginProceed);
  }
  void _onLoginProceed(
    AuthLoginProceedEvent event,
    Emitter<AuthLoginState> emit,
  ) async {
    emit(AuthLoginLoadingState());
    var request = AuthLoginRequest(
      email: event.email,
      password: event.password,
    );
    var result = await authLoginUseCase.execute(request);
    result.fold((ErrorDto error) {
      emit(AuthLoginFailedState(errorDto: ErrorDto(message: error.message)));
    }, (AuthUserDto user) {
      Future.delayed(const Duration(seconds: 1));
      preferences.setToken(user.token);
      emit(AuthLoginSuccessState(user: user));
    });
  }
}
