part of 'example_bloc.dart';

/// State data
class ExampleStateData extends Equatable {
  final int incrementValue;
  final List<PostDto> posts;
  final ErrorDto? error;

  const ExampleStateData({
    this.incrementValue = 0,
    this.posts = const [],
    this.error,
  });

  ExampleStateData copyWith({
    int? incrementValue,
    List<PostDto>? posts,
    ErrorDto? error,
  }) =>
      ExampleStateData(
        incrementValue: incrementValue ?? this.incrementValue,
        posts: posts ?? this.posts,
        error: error,
      );

  @override
  List<Object?> get props => [incrementValue, posts, error];
}

/// State
sealed class ExampleState {
  final ExampleStateData stateData;

  const ExampleState(this.stateData);
}

class ExampleInitialState extends ExampleState {
  const ExampleInitialState() : super(const ExampleStateData());
}

class ExampleLoadingState extends ExampleState {
  const ExampleLoadingState() : super(const ExampleStateData());
}

class ExampleDisplayPostsState extends ExampleState {
  const ExampleDisplayPostsState({
    required ExampleStateData stateData,
  }) : super(stateData);
}

class ExampleErrorState extends ExampleState {
  const ExampleErrorState({
    required ExampleStateData stateData,
  }) : super(stateData);
}
