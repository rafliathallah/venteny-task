// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

/// generated route for
/// [AuthPage]
class AuthRoute extends PageRouteInfo<void> {
  const AuthRoute({List<PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AuthPage();
    },
  );
}

/// generated route for
/// [ExamplePage]
class ExampleRoute extends PageRouteInfo<void> {
  const ExampleRoute({List<PageRouteInfo>? children})
      : super(
          ExampleRoute.name,
          initialChildren: children,
        );

  static const String name = 'ExampleRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ExamplePage();
    },
  );
}

/// generated route for
/// [MainPage]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MainPage();
    },
  );
}

/// generated route for
/// [PersonPage]
class PersonRoute extends PageRouteInfo<void> {
  const PersonRoute({List<PageRouteInfo>? children})
      : super(
          PersonRoute.name,
          initialChildren: children,
        );

  static const String name = 'PersonRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const PersonPage();
    },
  );
}

/// generated route for
/// [SplashPage]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SplashPage();
    },
  );
}

/// generated route for
/// [TaskItemPage]
class TaskItemRoute extends PageRouteInfo<TaskItemRouteArgs> {
  TaskItemRoute({
    Key? key,
    required TaskDto taskDto,
    required TaskBloc bloc,
    List<PageRouteInfo>? children,
  }) : super(
          TaskItemRoute.name,
          args: TaskItemRouteArgs(
            key: key,
            taskDto: taskDto,
            bloc: bloc,
          ),
          initialChildren: children,
        );

  static const String name = 'TaskItemRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TaskItemRouteArgs>();
      return TaskItemPage(
        key: args.key,
        taskDto: args.taskDto,
        bloc: args.bloc,
      );
    },
  );
}

class TaskItemRouteArgs {
  const TaskItemRouteArgs({
    this.key,
    required this.taskDto,
    required this.bloc,
  });

  final Key? key;

  final TaskDto taskDto;

  final TaskBloc bloc;

  @override
  String toString() {
    return 'TaskItemRouteArgs{key: $key, taskDto: $taskDto, bloc: $bloc}';
  }
}

/// generated route for
/// [TaskPage]
class TaskRoute extends PageRouteInfo<TaskRouteArgs> {
  TaskRoute({
    Key? key,
    required TaskBloc bloc,
    bool update = false,
    required TaskDto taskDto,
    List<PageRouteInfo>? children,
  }) : super(
          TaskRoute.name,
          args: TaskRouteArgs(
            key: key,
            bloc: bloc,
            update: update,
            taskDto: taskDto,
          ),
          initialChildren: children,
        );

  static const String name = 'TaskRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TaskRouteArgs>();
      return TaskPage(
        key: args.key,
        bloc: args.bloc,
        update: args.update,
        taskDto: args.taskDto,
      );
    },
  );
}

class TaskRouteArgs {
  const TaskRouteArgs({
    this.key,
    required this.bloc,
    this.update = false,
    required this.taskDto,
  });

  final Key? key;

  final TaskBloc bloc;

  final bool update;

  final TaskDto taskDto;

  @override
  String toString() {
    return 'TaskRouteArgs{key: $key, bloc: $bloc, update: $update, taskDto: $taskDto}';
  }
}
