  // Generated CLI by Rafli Athallah
  // For business email: rafliathallah.business@gmail.com

  enum Status { inProgress, completed, pending, }

class TaskDto {
  final int id;
  final String title;
  final String description;
  final String startDate;
  final String endDate;
  final String status;

  const TaskDto({
    this.id =0,
    this.title ='',
    this.description='',
    this.startDate='',
    this.endDate='',
    this.status=''
});

  @override
  String toString() {
    return 'TaskDto{id: $id, title: $title, description: $description, startDate: $startDate, endDate: $endDate, status: $status}';
  }

}
