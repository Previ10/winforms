// ignore_for_file: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_bloc_event.dart';
part 'counter_bloc_state.dart';

class CounterBloc extends Bloc<CounterBlocEvent, CounterBlocState> {
  CounterBloc() : super(const CounterBlocState()) {
    on<CounterIncreassed>(
        _onCounterIncreassed); //handler, para que se disparen eventos, podremos hacer los que querramos, segun cantidad de eventos
    on<CounterReset>(_onCounterReset);
  }

  void _onCounterIncreassed(
      CounterIncreassed event, Emitter<CounterBlocState> emit) {
    emit(state.copyWith(
        counter: state.counter + event.value,
        transactionCount: state.transactionCount + 1));
  }

  void _onCounterReset(CounterReset event, Emitter<CounterBlocState> emit) {
    emit(state.copyWith(
      counter: 0,
    ));
  }
}
