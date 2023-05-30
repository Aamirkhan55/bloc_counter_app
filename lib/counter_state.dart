import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@immutable
abstract class CounterState {
  final int value;

  const CounterState(this.value);
}

// Valid State 

class CounterStateValid extends CounterState {
  const CounterStateValid(int value) :super(value);
}

// InValid State
class CounterStateInValid extends CounterState {
  final String inValidValue;
 const CounterStateInValid({
  required this.inValidValue,
  required int previousValue,
 }) : super(previousValue);
}

// Event
@immutable
abstract class CounterEvent {
  final String value;
  const CounterEvent(this.value);
}

// Increments Counter 
class IncrementEvents extends CounterEvent {
  const IncrementEvents(String value) : super(value);
}

// Decrement Counter
class DecrementEvents extends CounterEvent {
  const DecrementEvents(String value) : super(value);
}

// Bloc

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterStateValid(0)) {
    on<IncrementEvents>((event, emit) {
     final intger = int.tryParse(event.value);
     if (intger == null) {
       emit(CounterStateInValid(inValidValue: event.value, previousValue: state.value));
     } else {
       emit(CounterStateValid(state.value + intger));
     }
    });
     on<DecrementEvents>((event, emit) {
     final intger = int.tryParse(event.value);
     if (intger == null) {
       emit(CounterStateInValid(inValidValue: event.value, previousValue: state.value));
     } else {
       emit(CounterStateValid(state.value - intger));
     }
    });
  }
}