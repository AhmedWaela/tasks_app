class TaskModel {
  final int taskId;
  final String title;
  final String? description;
  final DateTime dateTime;

  TaskModel({
    required this.taskId,
    required this.title,
    this.description,
    required this.dateTime,
  });

  Map<String, dynamic> toMap() {
    return {
      'taskId': taskId,
      'title': title,
      if (description != null) 'description': description,
      'dateTime': dateTime.toIso8601String(),
    };
  }

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      taskId: json['taskId'],
      title: json['title'],
      dateTime: DateTime.parse(json['dateTime']),
      description: json['description'],
    );
  }
}
