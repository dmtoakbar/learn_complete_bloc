import 'package:equatable/equatable.dart';

class CounterEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CounterIncrementEvent extends CounterEvent {
  int inCount;
  CounterIncrementEvent({required this.inCount});
  @override
  List<Object?> get props => [inCount];
}

class CounterDecrementEvent extends CounterEvent {
  int deCount;
  CounterDecrementEvent({required this.deCount});
  @override
  List<Object?> get props => [deCount];
}