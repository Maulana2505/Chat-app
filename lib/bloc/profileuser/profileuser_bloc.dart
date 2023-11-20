import 'package:bloc/bloc.dart';

import 'package:chat_app/api/user.dart';
import 'package:chat_app/bloc/profileuser/profileuser_event.dart';
import 'package:chat_app/bloc/profileuser/profileuser_state.dart';
import 'package:chat_app/repository/token.dart';

class ProfileuserBloc extends Bloc<ProfileuserEvent, ProfileuserState> {
  final _user = userApi();
  final token = TokenApi();
  ProfileuserBloc() : super(ProfileuserInitialState()) {
    on<ProfileuserLoadDataEvent>((event, emit) async {
      emit(ProfileuserLoadingDataState());
      try {
        final userdata = await _user.profileuser();
        emit(ProfileuserLoadDataState(user: userdata));
      } catch (e) {
        print(e);
        emit(ProfileuserErrorState(msg: e.toString()));
      }
    });
    on<ProfileUpdateDataEvent>((event, emit) async{
      var update = await _user.updateuser(event.username.toString(),event.img!);
      try {
      print(update);
      emit(ProfileUpdateDataSuccesState());
      } catch (e) {
        emit(ProfileUpdateDataFailedState(msg: update["msg"]));
      }
    });
  }
  @override
  Future<void> close() {
    // TODO: implement close
    ProfileuserBloc().close();
    return super.close();
  }
}
