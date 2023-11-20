import 'package:equatable/equatable.dart';

abstract class PendingEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class PendingLoadDataEvent extends PendingEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class PendingDeleteEvent extends PendingEvent{
  String id;
  PendingDeleteEvent({required this.id});
  @override
  // TODO: implement props
  List<Object?> get props => [id];
}