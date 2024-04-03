class TaskModel {
  String? id;
  String? task;
  String? description;
  String? priority;
  bool? isComplete;
  String? createdAt;

  TaskModel({
    this.id,
    this.task,
    this.description,
    this.priority,
    this.isComplete,
    this.createdAt,
  });

  TaskModel.fromJson(Map<String, dynamic> json, String this.id) {
    task = json['task'];
    description = json['description'];
    priority = json['priority'];
    isComplete = json['isComplete'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['task'] = task;
    data['description'] = description;
    data['priority'] = priority;
    data['isComplete'] = isComplete;
    data['createdAt'] = createdAt;
    return data;
  }
}
