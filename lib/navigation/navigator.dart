import 'router/router.dart';
import 'package:injectable/injectable.dart';

@injectable
class BaseNavigator {
  BaseNavigator(this._router);
  final AppRouter _router;

//for Routing in Bloc using Event
Future<void>goToExmaplePage()=>_router.push(const ExampleRoute());
}
