import 'dart:async';

import 'dao/task_dao.dart';
import 'entities/task_entity.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'database_migration.dart';

part 'app_database.g.dart';

@Database(version: DatabaseMigration.databaseVersion, entities: [TaskEntity])
abstract class AppDatabase extends FloorDatabase {
  TaskDao get taskDao;
}
