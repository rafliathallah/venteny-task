part of 'person_bloc.dart';

class PersonStatedata extends Equatable{
  final PersonDto? person;
  final ErrorDto?error;

  const PersonStatedata({this.person,this.error});
  
  PersonStatedata copywith({
    PersonDto? person,
    ErrorDto? error,
  })=>PersonStatedata(person: person,error: error);

  @override
  List<Object?> get props => [person,error];
}

sealed class PersonState {
  final PersonStatedata statedata;
  const PersonState(this.statedata);
}

class PersonInitialState extends PersonState {
  PersonInitialState(super.statedata);
}

class PersonLoadingState extends PersonState {
  PersonLoadingState(super.statedata);
}

class PersonFailedState extends PersonState {
  PersonFailedState(super.statedata);
}

class PersonSuccessState extends PersonState {
  PersonSuccessState(super.statedata);

}
