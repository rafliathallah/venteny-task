import 'package:bloc/bloc.dart';
import '../../../../core/domain/models/error_dto.dart';
import '../../domain/models/post_dto.dart';
import '../../domain/usecases/get_post_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'example_event.dart';
part 'example_state.dart';

/// Bloc
@injectable
class ExampleBloc extends Bloc<ExampleEvent, ExampleState> {
  final GetPostUseCase getPostUseCase;

  ExampleStateData stateData = const ExampleStateData();

  ExampleBloc({
    required this.getPostUseCase,
  }) : super(const ExampleInitialState()) {
    on<ExampleEvent>(
      (event, emit) => switch (event) {
        ExampleInitEvent() => emit(const ExampleInitialState()),
        ExampleGetPostEvent() => _onExampleGetPostEvent(emit),
        ExampleIncrementEvent() => _onIncrement(emit)
      },
    );
    add(ExampleGetPostEvent());
  }

  void _onExampleGetPostEvent(Emitter<ExampleState> emit) async {
    if (state is! ExampleLoadingState) {
      emit(const ExampleLoadingState());
      final result = await getPostUseCase.execute();
      result.fold(
        (ErrorDto error) => emit(ExampleErrorState(stateData: stateData.copyWith(error: error))),
        (data) {
          stateData = stateData.copyWith(posts: data, error: null);
          emit(ExampleDisplayPostsState(stateData: stateData));
        },
      );
    }
  }

  void _onIncrement(Emitter<ExampleState> emit) {
    stateData =
        stateData.copyWith(incrementValue: stateData.incrementValue + 1);
    emit(ExampleDisplayPostsState(stateData: stateData));
  }
}
