part of 'counter_bloc_bloc.dart';

abstract class CounterBlocEvent {
  const CounterBlocEvent();
}

class CounterIncreassed extends CounterBlocEvent {
  final int value;

  const CounterIncreassed(this.value);
}

class CounterReset extends CounterBlocEvent {}
