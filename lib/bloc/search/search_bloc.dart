import 'package:bloc/bloc.dart';
import 'package:chat_app/api/friend.dart';
import 'package:chat_app/api/user.dart';
import 'package:chat_app/bloc/search/search_event.dart';
import 'package:chat_app/bloc/search/search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final userapi = userApi();
  final friend = friendApi();
  SearchBloc() : super(SearchInitialState()) {
    on<SearchLoadDataEvent>((event, emit) async {
      emit(SearchLoadingState());
      try {
        final searchdata = await userapi.finduser(event.query);
        emit(SearchLoadDataState(user: searchdata)); 
        print(searchdata);
      } catch (e) {
        emit(SearchErrorState(e.toString()));
      }
    });
  }
  @override
  Future<void> close() {
    // TODO: implement close
    SearchBloc().close();
    return super.close();
  }
}
