import 'package:equatable/equatable.dart';

class CounterState extends Equatable {
  @override
  List<Object?> get props => [];

}

class CounterInitialState extends CounterState {
  int? count;
  CounterInitialState({required this.count});
  @override
  List<Object?> get props => [count];
}

class CounterIncrementState extends CounterState {
  int? incCount;
  CounterIncrementState({required this.incCount});

  @override
  List<Object?> get props => [incCount];
}

class CounterDecrementState extends CounterState {
  int? deCount;
  CounterDecrementState({required this.deCount});
  @override
  List<Object?> get props => [deCount];
}