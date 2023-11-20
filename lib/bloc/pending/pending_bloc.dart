import 'package:bloc/bloc.dart';
import 'package:chat_app/api/friend.dart';
import 'package:chat_app/bloc/pending/pending_event.dart';
import 'package:chat_app/bloc/pending/pending_state.dart';

class PendingBloc extends Bloc<PendingEvent,PendingState>{
  final _friend = friendApi();
  PendingBloc() : super(PendingInitialState()){
    on<PendingLoadDataEvent>((event, emit) async{
      emit(PendingLoadingState());
      try { 
        final pendingdata = await _friend.pending();
        // print(pendingdata);
        emit(PendingLoadDataState(data:pendingdata));
      } catch (e) {
        emit(PendingErorrState(msg:e.toString()));
      }
    });
    on<PendingDeleteEvent>((event, emit) async{
      try {
        final delpen = await _friend.pendingdelete(event.id.toString());
        print(delpen);
        emit(PendingDeleteSuccesState());
      } catch (e) {
        print(e);
        emit(PendingDeleteErorrState(msg: e.toString()));
      }
    });
  }

}