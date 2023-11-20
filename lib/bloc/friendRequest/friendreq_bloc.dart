import 'package:bloc/bloc.dart';
import 'package:chat_app/bloc/friendRequest/friendreq_event.dart';
import 'package:chat_app/bloc/friendRequest/friendreq_state.dart';

import '../../api/friend.dart';

class FriendreqBloc extends Bloc<FriendreqEvent, FriendreqState> {
  final _friend = friendApi();
  FriendreqBloc() : super(FriendreqInitialState()) {
    on<FriendreqLoadDataEvent>((event, emit) async {
      emit(FriendreqLoadingState());
      try {
        final friendreqdata = await _friend.friendreq();
        // print(pendingdata);
        emit(FriendreqLoadDataState(friendreqdata));
      } catch (e) {
        emit(FriendreqErorrState(e.toString()));
      }
    });

    on<FriendaccEvent>((event, emit) async {
      try {
        final facc = await _friend.friendacc(event.id.toString());
        print(facc["msg"]);
        emit(FriendaccSuccesState());
      } catch (e) {
        emit(FriendaccErorState(msg: e.toString()));
      }
    });
    on<FriendAddEvent>((event, emit) async {
      try {
        final add = await _friend.friendadd(event.id.toString());
        emit(FriendAddSuscesState());
      } catch (e) {
        emit(FriendAddErorState(msg: e.toString()));
      }
    });
  }
}
