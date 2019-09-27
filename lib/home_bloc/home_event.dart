import 'package:english_vocabulary/data/model/topic.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class HomeEvent extends Equatable {
  HomeEvent([List props = const <dynamic>[]]) : super(props);
}

class HomeLoadRemoteDataEvent extends HomeEvent {

  @override
  String toString() => "Home load remote data";
}

class HomeLoadLocalDataEvent extends HomeEvent {
  @override
  String toString() => "Home load local data";
}
