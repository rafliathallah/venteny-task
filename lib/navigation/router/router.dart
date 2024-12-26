import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

import '../../src/auth/presentation/auth_page.dart';
import '../../src/example/presentation/example/example_page.dart';
import '../../src/main/presentation/main_page.dart';
import '../../src/profile/persentation/person_page.dart';
import '../../src/splash/presentation/splash_page.dart';
import '../../src/task/domain/models/task_dto.dart';
import '../../src/task/presentation/bloc/task_bloc.dart';
import '../../src/task/presentation/task_item_page.dart';
import '../../src/task/presentation/task_page.dart';

part 'router.gr.dart';

@lazySingleton
@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  AppRouter(GlobalKey<NavigatorState> navigatorKey)
      : super(navigatorKey: navigatorKey);
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, path: "/splash",initial: true),
        AutoRoute(page: MainRoute.page, path: "/main", initial: false),
        AutoRoute(page: ExampleRoute.page, path: '/example'),
        AutoRoute(
          page: AuthRoute.page,
          path: '/auth',
        ),
        AutoRoute(page: PersonRoute.page, path: '/person'),
        AutoRoute(page: TaskRoute.page, path: '/task'),
        AutoRoute(page: TaskItemRoute.page, path: '/task-items'),
      ];
}

