import 'package:equatable/equatable.dart';

abstract class SigninState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SigninInitial extends SigninState {}

class SigninLoadingState extends SigninState {}

class SigninFailureState extends SigninState {
  final String msg;

  SigninFailureState(this.msg);
  @override
  List<Object?> get props => [msg];
}
