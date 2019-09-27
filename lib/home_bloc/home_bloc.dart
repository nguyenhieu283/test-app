import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import './bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final DataRepository _dataRepository;

  HomeBloc({@required dataRepository})
      : assert(dataRepository != null),
        _dataRepository = dataRepository;

  @override
  HomeState get initialState => InitialHomeState();

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is HomeLoadRemoteDataEvent) {
      yield HomeLoadingState();
      var listTopicId = event.topics.map((item) => item.topicId).toList();
      _dataRepository.saveTopicsToDb(event.topics);
      List<Word> listWord = await _dataRepository.getWords(listTopicId, event.languageCode);
      if (listWord.length > 0) {
        yield HomeLoadingSuccessState(listWord: listWord);
        _dataRepository.saveWordsToDb(listWord);
      } else {
        yield HomeLoadingFailedState();
      }
    } else if (event is HomeLoadLocalDataEvent) {
      yield HomeLoadingSuccessState(listWord: []);
    }
  }
}
