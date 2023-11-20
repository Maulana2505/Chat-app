import 'package:chat_app/model/search/search_model2.dart';
import 'package:equatable/equatable.dart';



abstract class SearchState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SearchInitialState extends SearchState {}

class SearchLoadingState extends SearchState {}

class SearchLoadDataState extends SearchState {
  final List<SearchM2>? user;
  SearchLoadDataState({required this.user});
}

class SearchErrorState extends SearchState {
  String msg;
  SearchErrorState(this.msg);
}
