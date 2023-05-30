import 'package:flutter/material.dart';

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