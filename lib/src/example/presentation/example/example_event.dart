part of 'example_bloc.dart';

sealed class ExampleEvent {
  const ExampleEvent();
}

class ExampleInitEvent implements ExampleEvent {}

class ExampleGetPostEvent implements ExampleEvent {}

class ExampleIncrementEvent implements ExampleEvent {
  final int increment;
  ExampleIncrementEvent({required this.increment});
}
