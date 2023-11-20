

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chat_app/api/user.dart';
import 'package:chat_app/bloc/signup/signup_event.dart';
import 'package:chat_app/bloc/signup/signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  userApi userapi;
  SignupBloc(this.userapi) : super(SignupInitialState()) {
    on<SignupDataEvent>((event, emit) async {
      emit(SignupLoadingState());
      try {
        await userapi.Signup(event.email, event.username, event.password);
        emit(SignupSuccesState());
      } catch (e) {
      emit(SignupErrorState(e.toString()));
      }

    });
  }
}
