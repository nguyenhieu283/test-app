import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AuthenticationState extends Equatable {
//  AuthenticationState([List props = const <dynamic>[]]) : super(props);
}

class InitialAuthenticationState extends AuthenticationState {
  @override
  String toString() => "InitialAuthenticationState";
}

class AuthenticatingState extends AuthenticationState{
  @override
  String toString() => "Loading authentication";
}

class AuthenticatedState extends AuthenticationState {
  @override
  String toString() => "Authenticated";
}

class UnauthenticatedState extends AuthenticationState {
  @override
  String toString() => "Unauthenticated";
}
