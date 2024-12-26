import 'package:barrel_files_annotation/barrel_files_annotation.dart';
import '../data/remote/interceptors/auth_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
@includeInBarrelFile
abstract class NetworkModule {
  @prod
  @Named('base_url')
  String get prodBaseUrl => 'https://jsonplaceholder.typicode.com/';
  @test
  @Named('base_url')
  String get testBaseUrl => 'https://reqres.in/';
  @dev
  @Named('base_url')
  String get baseUrl => 'https://reqres.in/';

  @singleton
  AuthInterceptor get authInterceptor => AuthInterceptor();

  @singleton
  Dio dio(
    @Named('base_url') String baseUrl,
    AuthInterceptor authInterceptor,
  ) {
    var option = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 15),
      sendTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
    );

    var dio = Dio(option);
    dio.interceptors.add(authInterceptor);

    return dio;
  }
}
