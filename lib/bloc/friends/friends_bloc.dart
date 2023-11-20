import 'package:bloc/bloc.dart';
import 'package:chat_app/bloc/friends/friends_event.dart';
import 'package:chat_app/bloc/friends/friends_state.dart';

import '../../api/friend.dart';

class FriendsBloc extends Bloc<FriendsEvent, FriendsState> {
  final _friend = friendApi();
  FriendsBloc() : super(FriendsInitialState()) {
    on<FriendsLoadDataEvent>((event, emit) async {
      emit(FriendsLoadingState());
      try {
        final frienddata = await _friend.friends();
        emit(FriendsLoadDataState(frienddata));
      } catch (e) {
        emit(FriendsErorrState(msg: e.toString()));
      }
    });
    on<FriendsDeleteEvent>((event, emit) async {
      try {
        final frdel = await _friend.FriendDelete(event.id.toString());
        print(frdel);
        emit(FriendsDeleteSuccesState());
      } catch (e) {
        emit(FriendsDeleteErorrState(msg: e.toString()));
      }
    });
  }
  @override
  Future<void> close() {
    // TODO: implement close
    FriendsBloc().close();
    return super.close();
  }
}
