import 'package:equatable/equatable.dart';

abstract class SigninEvent extends Equatable{}
class SigninButtonPressed extends SigninEvent {

  final String username;
  final String password;
  SigninButtonPressed({
    required this.username,
    required this.password,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [username,password];
}
