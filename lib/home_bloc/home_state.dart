import 'package:english_vocabulary/data/model/word.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class HomeState extends Equatable {
  HomeState([List props = const <dynamic>[]]) : super(props);
}

class InitialHomeState extends HomeState {
  @override
  String toString() => "Init home state";
}

class HomeLoadingState extends HomeState {
  @override
  String toString() => "Home loading";
}

class HomeLoadingSuccessState extends HomeState {
  final List<Word> listWord;

  HomeLoadingSuccessState({@required this.listWord});

  @override
  String toString() => "Home loading success";
}

class HomeLoadingFailedState extends HomeState {
  @override
  String toString() => "Home loading failed";
}
