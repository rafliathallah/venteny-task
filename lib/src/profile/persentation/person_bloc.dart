import 'package:bloc/bloc.dart';
import '../../../core/domain/models/error_dto.dart';
import '../domain/models/person_dto.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../domain/usecases/person_usecase.dart';

part 'person_event.dart';
part 'person_state.dart';

@injectable
class PersonBloc extends Bloc<PersonEvent, PersonState> {
  final PersonUseCase personUseCase;
  PersonStatedata statedata = const PersonStatedata();

  PersonBloc({required this.personUseCase}) : super(PersonInitialState(const PersonStatedata())) {
    on<PersonEvent>((event, emit) => switch (event) {
          PersonInitEvent() => emit(PersonFailedState(statedata)),
          PersonGetPersonEvent() => _onGetPerson(emit)
        });
    add(PersonGetPersonEvent());
  }

  void _onGetPerson(Emitter<PersonState> emit) async {
    if (state is !PersonLoadingState) {
    emit(PersonLoadingState(statedata));
    final result = await personUseCase.execute();
    result.fold(
        (ErrorDto error) => emit(PersonFailedState(statedata.copywith(error: error))),
        (data) {
          statedata = statedata.copywith(person: data);
          emit(PersonSuccessState(statedata));
        });
    }
  }
}
