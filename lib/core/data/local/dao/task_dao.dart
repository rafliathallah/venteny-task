import '../entities/task_entity.dart';
import 'package:floor/floor.dart';

@dao
abstract class TaskDao {
  @Query('SELECT * FROM task_db')
  Future<List<TaskEntity>> getAllTask();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertTask(TaskEntity task);

  @Update(onConflict: OnConflictStrategy.replace)
  Future<void> updateTask(TaskEntity task);

  @Query('UPDATE task_db SET title= :title, description = :description, date_start = :dateStart, end_date = :dateEnd, status= :status WHERE id = :id')
  Future<void> updateTaskById(
      int id,
      String title,
      String description,
      String dateStart,
      String dateEnd,
      String status,
      );

  @Query('DELETE FROM task_db WHERE id = :id')
  Future<void> deleteDataById(int id);

  @Query('DELETE FROM task_db')
  Future<void> deleteAllData();

  @Query('SELECT * FROM task_db WHERE status = :status')
  Future<List<TaskEntity>> getTasksByStatus(String status);


  @Query('SELECT * FROM task_db WHERE date_start >= :startDate AND date_end <= :endDate')
  Future<List<TaskEntity>> getTasksByDateRange(String startDate, String endDate);

}
