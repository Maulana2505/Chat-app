import 'package:equatable/equatable.dart';

abstract class SearchEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SearchLoadDataEvent extends SearchEvent {
  String query;
  SearchLoadDataEvent({required this.query});
  @override
  // TODO: implement props
  List<Object?> get props => [query];
}

