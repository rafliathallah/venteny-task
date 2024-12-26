// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

abstract class $AppDatabaseBuilderContract {
  /// Adds migrations to the builder.
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations);

  /// Adds a database [Callback] to the builder.
  $AppDatabaseBuilderContract addCallback(Callback callback);

  /// Creates the database and initializes it.
  Future<AppDatabase> build();
}

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder implements $AppDatabaseBuilderContract {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  @override
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  @override
  $AppDatabaseBuilderContract addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  @override
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  TaskDao? _taskDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `task_db` (`id` INTEGER NOT NULL, `title` TEXT, `description` TEXT, `date_start` TEXT, `end_date` TEXT, `status` TEXT, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  TaskDao get taskDao {
    return _taskDaoInstance ??= _$TaskDao(database, changeListener);
  }
}

class _$TaskDao extends TaskDao {
  _$TaskDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _taskEntityInsertionAdapter = InsertionAdapter(
            database,
            'task_db',
            (TaskEntity item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'description': item.description,
                  'date_start': item.dateStart,
                  'end_date': item.dateEnd,
                  'status': item.status
                }),
        _taskEntityUpdateAdapter = UpdateAdapter(
            database,
            'task_db',
            ['id'],
            (TaskEntity item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'description': item.description,
                  'date_start': item.dateStart,
                  'end_date': item.dateEnd,
                  'status': item.status
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<TaskEntity> _taskEntityInsertionAdapter;

  final UpdateAdapter<TaskEntity> _taskEntityUpdateAdapter;

  @override
  Future<List<TaskEntity>> getAllTask() async {
    return _queryAdapter.queryList('SELECT * FROM task_db',
        mapper: (Map<String, Object?> row) => TaskEntity(
            id: row['id'] as int,
            title: row['title'] as String?,
            description: row['description'] as String?,
            dateStart: row['date_start'] as String?,
            dateEnd: row['end_date'] as String?,
            status: row['status'] as String?));
  }

  @override
  Future<void> updateTaskById(
    int id,
    String title,
    String description,
    String dateStart,
    String dateEnd,
    String status,
  ) async {
    await _queryAdapter.queryNoReturn(
        'UPDATE task_db SET title= ?2, description = ?3, date_start = ?4, end_date = ?5, status= ?6 WHERE id = ?1',
        arguments: [id, title, description, dateStart, dateEnd, status]);
  }

  @override
  Future<void> deleteDataById(int id) async {
    await _queryAdapter
        .queryNoReturn('DELETE FROM task_db WHERE id = ?1', arguments: [id]);
  }

  @override
  Future<void> deleteAllData() async {
    await _queryAdapter.queryNoReturn('DELETE FROM task_db');
  }

  @override
  Future<List<TaskEntity>> getTasksByStatus(String status) async {
    return _queryAdapter.queryList('SELECT * FROM task_db WHERE status = ?1',
        mapper: (Map<String, Object?> row) => TaskEntity(
            id: row['id'] as int,
            title: row['title'] as String?,
            description: row['description'] as String?,
            dateStart: row['date_start'] as String?,
            dateEnd: row['end_date'] as String?,
            status: row['status'] as String?),
        arguments: [status]);
  }

  @override
  Future<List<TaskEntity>> getTasksByDateRange(
    String startDate,
    String endDate,
  ) async {
    return _queryAdapter.queryList(
        'SELECT * FROM task_db WHERE date_start >= ?1 AND date_end <= ?2',
        mapper: (Map<String, Object?> row) => TaskEntity(
            id: row['id'] as int,
            title: row['title'] as String?,
            description: row['description'] as String?,
            dateStart: row['date_start'] as String?,
            dateEnd: row['end_date'] as String?,
            status: row['status'] as String?),
        arguments: [startDate, endDate]);
  }

  @override
  Future<void> insertTask(TaskEntity task) async {
    await _taskEntityInsertionAdapter.insert(task, OnConflictStrategy.replace);
  }

  @override
  Future<void> updateTask(TaskEntity task) async {
    await _taskEntityUpdateAdapter.update(task, OnConflictStrategy.replace);
  }
}
