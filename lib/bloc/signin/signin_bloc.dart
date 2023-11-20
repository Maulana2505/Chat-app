import 'package:bloc/bloc.dart';

import 'package:chat_app/api/user.dart';
import 'package:chat_app/bloc/signin/signin_even.dart';
import 'package:chat_app/bloc/signin/signin_state.dart';
import 'package:chat_app/repository/token_secure.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  userApi userapi;
  final token = tokensecure();
  SigninBloc(
    this.userapi,
  ) : super(SigninInitial()) {
    on<SigninButtonPressed>((event, emit) async {
      emit(SigninLoadingState());
      try {
        final signin = await userapi.Signin(event.username, event.password);
        print(signin);
        token.writeToken("token", signin["token"].toString());
        token.writeToken("id",signin["id"].toString());
        emit(SigninInitial());
      } catch (e) {
        emit(SigninFailureState(e.toString()));
      }
    });
  }
  @override
  Future<void> close() {
    // TODO: implement close
    SigninBloc(userapi).close();
    return super.close();
  }
}
