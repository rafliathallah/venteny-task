import 'package:floor/floor.dart';

@Entity(tableName: 'task_db')
class TaskEntity {
  @PrimaryKey()
  final int id;
  @ColumnInfo(name: 'title')
  final String? title;
  @ColumnInfo(name: 'description')
  final String? description;
  @ColumnInfo(name: 'date_start')
  final String? dateStart;
  @ColumnInfo(name: 'end_date')
  final String? dateEnd;
  @ColumnInfo(name: 'status')
  final String? status;


  const TaskEntity({
    required this.id,
   this.title,
    this.description,
    this.dateStart,
    this.dateEnd,
    this.status
   
  });

  TaskEntity copyWith({
    int? id,
    String? title,
    String? description,
    String? dateStart,
    String? dateEnd,
    String? status,
  }) {
    return TaskEntity(
        id: id ?? this.id,
        title: title??this.title,
        description: description??this.description,
        dateStart: dateStart??this.dateStart,
        dateEnd: dateEnd??this.dateEnd,
        status: status??this.status
    );
  }
}