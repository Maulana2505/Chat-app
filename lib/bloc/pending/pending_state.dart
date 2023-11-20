import 'package:equatable/equatable.dart';

import '../../model/pending/pending_data.dart';

abstract class PendingState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class PendingInitialState extends PendingState {}

class PendingLoadingState extends PendingState {}

class PendingLoadDataState extends PendingState {
  final List<Pending>? data;
  PendingLoadDataState({required this.data});
  // final Pending? data;
  @override
  // TODO: implement props
  List<Object?> get props => [data];
}

class PendingEmptyState extends PendingState {}

class PendingErorrState extends PendingState {
  String msg;
  PendingErorrState({required this.msg});
  @override
  // TODO: implement props
  List<Object?> get props => [msg];
}

class PendingDeleteSuccesState extends PendingState{

}  

class PendingDeleteErorrState extends PendingState{
  String msg;
  PendingDeleteErorrState({
    required this.msg,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [msg];
}