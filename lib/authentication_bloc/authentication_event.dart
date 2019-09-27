import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AuthenticationEvent extends Equatable {
  AuthenticationEvent([List props = const <dynamic>[]]) : super(props);
}

class CheckUserLoggedInEvent extends AuthenticationEvent{
  @override
  String toString() => "Check user logged in";
}

class LogInViaGoogleEvent extends AuthenticationEvent {
  @override
  String toString() => "Request login via Google";
}

class LogInViaFacebookEvent extends AuthenticationEvent {
  @override
  String toString() => "Request login via Facebook";
}

class LogInWithEmailPasswordEvent extends AuthenticationEvent {
  @override
  String toString() => "Request login in with email password";
}

class SignOutEvent extends AuthenticationEvent {
  @override
  String toString() => "Sign Out";
}
