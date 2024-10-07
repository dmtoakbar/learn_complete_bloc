import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_bloc_complete/counter/bloc/counter_events.dart';
import 'package:study_bloc_complete/counter/bloc/counter_states.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc():super(CounterInitialState(count: 0)){

    on<CounterIncrementEvent>((event, emit) {
      emit(CounterIncrementState(incCount: event.inCount+1));
    });

    on<CounterDecrementEvent>((event, emit) {
      emit(CounterDecrementState(deCount: event.deCount-1));
    });
  }
}