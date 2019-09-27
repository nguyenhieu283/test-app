import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import './bloc.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository _userRepository;

  AuthenticationBloc({@required userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  AuthenticationState get initialState => InitialAuthenticationState();

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is LogInViaGoogleEvent) {
//      yield AuthenticatingState();
      bool isSuccess = await _userRepository.signInWithGoogle();
      if (isSuccess) {
        print("Login google success");
        yield AuthenticatedState();
      } else {
        print("Login failed");
        yield UnauthenticatedState();
      }
    } else if (event is LogInWithEmailPasswordEvent) {
    } else if (event is LogInViaFacebookEvent) {
      yield AuthenticatingState();
      bool isSuccess = await _userRepository.signInWithFacebook();
      if (isSuccess) {
        print("Login success");
        yield AuthenticatedState();
      } else {
        yield UnauthenticatedState();
      }
    } else if (event is CheckUserLoggedInEvent) {
      bool isSignedIn = await _userRepository.isSignedIn();
      if (isSignedIn) {
        yield AuthenticatedState();
      } else {
        yield UnauthenticatedState();
      }
    } else if (event is SignOutEvent) {
      bool isSignOut = await _userRepository.signOut();
      if (isSignOut) {
        yield UnauthenticatedState();
      }
    }
  }
}
