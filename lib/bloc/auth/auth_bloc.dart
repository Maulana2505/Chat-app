// ignore_for_file: use_function_type_syntax_for_parameters, invalid_use_of_visible_for_testing_member

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chat_app/bloc/auth/auth_event.dart';
import 'package:chat_app/bloc/auth/auth_state.dart';

import '../../repository/token_secure.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  tokensecure token;
  AuthenticationBloc(
    this.token,
  ) : super(AuthenticationUninitialized()) {
    on<AppStarted>((event, emit) async {
      emit(AuthenticationLoading());
      bool hasToken = await token.containsData("token");
      if (hasToken) {
        print(hasToken);
        emit(AuthenticationAuthenticated());
      } else {
        emit(AuthenticationUnauthenticated());
        token.deleteToken("token");
      }
    });
    on<LoggedIn>((event, emit) async {
      emit(AuthenticationLoading());
      token.writeToken("token", event.token);
      emit(AuthenticationAuthenticated());
    });
    on<LoggedOut>((event, emit) async {
      emit(AuthenticationLoading());
      await token.deleteToken("token");
      print("token delete");
      emit(AuthenticationUnauthenticated());
    });
  }

}
