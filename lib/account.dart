import 'package:english_vocabulary/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:english_vocabulary/bloc/authentication_bloc/authentication_event.dart';
import 'package:english_vocabulary/ui/login.dart';
import 'package:english_vocabulary/ui/register.dart';
import 'package:english_vocabulary/ui/widgets/tab_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountScreen extends StatelessWidget {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    print("On Build account Widget");
    AuthenticationBloc _authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Container(
          padding: EdgeInsets.only(bottom: 50, top: 70, left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              _buildMenuBar(context),
              Expanded(
                child: Container(
                  child: PageView(
                    controller: _pageController,
                    key: PageStorageKey("page_view_login"),
                    onPageChanged: (index) => _onPageChanged(index),
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[BlocProvider(child: LoginPage(), builder: (_) => _authenticationBloc,), RegisterPage()],
                  ),
                ),
              ),
              Text("Or", style: TextStyle(color: Color(0xffbcbcbc), fontSize: 16, fontWeight: FontWeight.w700)),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      child: Image.asset("assets/facebook_icon.png", width: 36, height: 36),
                      onTap: () {
                        print("SIGN IN FACEBOOK");
                        _authenticationBloc.dispatch(LogInViaFacebookEvent());
                      },
                    ),
                    SizedBox(width: 30, height: 0),
                    GestureDetector(
                        child: Image.asset("assets/google_icon.png", width: 36, height: 36),
                        onTap: () {
                          print("SIGN IN GOOGLE");
                          _authenticationBloc.dispatch(LogInViaGoogleEvent());
                        }),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  Widget _buildMenuBar(BuildContext context) {
    return Container(
      width: 300,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xfff2f21), width: 1),
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
      ),
      child: CustomPaint(
        painter: TabIndicationPainter(
          pageController: _pageController,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: FlatButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: () => _pageController.animateToPage(0, duration: Duration(milliseconds: 500), curve: Curves.decelerate),
                child: SizedBox(),
              ),
            ),
            Expanded(
              child: FlatButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: () => _pageController.animateToPage(1, duration: Duration(milliseconds: 500), curve: Curves.decelerate),
                child: SizedBox(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _onPageChanged(int index) {
    print("onPagechanged $index");
  }
}
