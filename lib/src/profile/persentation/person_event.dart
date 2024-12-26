part of 'person_bloc.dart';

sealed class PersonEvent {
  const PersonEvent();
}

class PersonInitEvent implements PersonEvent {}

class PersonGetPersonEvent implements PersonEvent {}
