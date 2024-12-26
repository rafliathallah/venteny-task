import 'di_initializer.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

@injectableInit
//Fungsi Iject Tablle Initial dengan parameter untuk membungkusnya dan param enviromnet sebagai flavor
Future<GetIt> initDI(GetIt getIt, String environment) =>
    getIt.init(environment: environment);
