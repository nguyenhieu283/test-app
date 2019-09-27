import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonalPage extends StatelessWidget {
  final ValueNotifier<String> _userAvatar = ValueNotifier("");
  final ValueNotifier<String> _userName = ValueNotifier("");

  @override
  Widget build(BuildContext context) {
    AuthenticationBloc _authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(top: 30, right: 10, left: 10),
        child: Align(
          alignment: Alignment.topCenter,
          child: Column(
            children: <Widget>[
              Align(alignment: Alignment.centerLeft, child: Text("GOLD")),
              Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    child: Text("Sign out"),
                    
                    //// this problem cause in here
                    
                    onTap: () => _authenticationBloc.dispatch(SignOutEvent()),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
