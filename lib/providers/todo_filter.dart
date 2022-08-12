import 'package:flutter/material.dart';

import '../models/todo_model.dart';

class TodoFilterState{
  final Filter filter;

  TodoFilterState({
    required this.filter
  });

  factory TodoFilterState.initial(){
    return TodoFilterState(filter: Filter.all);
  }

  @override
  List<Object> get props => [filter];

  @override
  bool get stringify => true;

  TodoFilterState copyWith({
  Filter? filter,
  }){
    return TodoFilterState(
      filter : filter ?? this.filter,
    );
  }
}

class TodoFilter with ChangeNotifier{
  TodoFilterState _state = TodoFilterState.initial();
  TodoFilterState get state => _state;

  void changeFilter(Filter newFilter){
    _state = _state.copywith(filter: newFilter);
    notifyListeners();
  }
}