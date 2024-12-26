
import '../data/local/dao/task_dao.dart';

import '../data/local/app_database.dart';
import '../data/local/app_preferences.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/local/database_migration.dart';

@module
abstract class LocalModule {
  @singleton
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @singleton
  AppPreferences appPreferences(SharedPreferences prefs) =>
      AppPreferences(prefs);

  @singleton
  DatabaseMigration get dbMigration => DatabaseMigration();
  @preResolve
  Future<AppDatabase> appDatabase() async => await $FloorAppDatabase
      .databaseBuilder(DatabaseMigration.databaseName)
      .build();
  @singleton
  TaskDao taskDao(AppDatabase appDatabase) => appDatabase.taskDao;
}