import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/personal.dart';

class MyHomePage extends StatelessWidget {
  final AuthenticationBloc _authenticationBloc = AuthenticationBloc(userRepository: UserRepository());
  final HomeBloc homeBloc = HomeBloc(dataRepository: DataRepository());
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          body: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is HomeLoadingState) {
                return Center(child: CircularProgressIndicator());
              }
              if (state is HomeLoadingSuccessState) {
                _authenticationBloc.dispatch(CheckUserLoggedInEvent());

                return Container(
                  child: BlocBuilder(
                    builder: (context, state) {
                      if (state is AuthenticatedState) {
                        return TabBarView(
                          children: <Widget>[
                            _buildHomeTab(context),
                            BlocProvider(builder: (_) => _authenticationBloc, child: PersonalPage()),
                            _buildRankTab(context),
                          ],
                        );
                      } else if (state is UnauthenticatedState) {
                        return TabBarView(
                          children: <Widget>[
                            _buildHomeTab(context),
                            BlocProvider(child: AccountScreen(), builder: (_) => _authenticationBloc),
                            _buildRankTab(context),
                          ],
                        );
                      }
                      return Center(child: CircularProgressIndicator());
                    },
                    bloc: _authenticationBloc,
                  ),
                );
              }
              if (state is HomeLoadingFailedState) {
                return SizedBox();
              }
              return SizedBox();
            },
            bloc: homeBloc,
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 30.0, // has the effect of softening the shadow
                spreadRadius: 2.0, // has the effect of extending the shadow
                offset: Offset(0.0, 55.0),
              )
            ]),
            child: TabBar(
              tabs: <Widget>[
                Tab(icon: Icon(Icons.home)),
                Tab(icon: Icon(Icons.person_outline)),
                Tab(icon: Icon(Icons.featured_play_list))
              ],
              labelColor: Colors.blue,
              unselectedLabelColor: const Color(0xffbcbcbc),
              indicatorSize: TabBarIndicatorSize.label,
              labelPadding: EdgeInsets.all(0),
              indicatorWeight: 2.5,
            ),
          )),
    );
  }
}
