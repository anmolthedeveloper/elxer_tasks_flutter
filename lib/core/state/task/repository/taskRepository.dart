import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/task.dart';

class TaskRepository {
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

  Future<void> addTask(TaskModel task, String email) async {
    try {
      await usersCollection.doc(email).collection('tasks').add(task.toJson());
    } catch (e) {
      debugPrint("Error adding task: $e");
      rethrow;
    }
  }

  Future<List<TaskModel?>> fetchTasksForEmail(String email) async {
    try {
      QuerySnapshot querySnapshot = await usersCollection
          .doc(email)
          .collection('tasks')
          // .orderBy('timestamp', descending: true)
          .get();

      List<TaskModel?> tasks = querySnapshot.docs.map((doc) {
        return TaskModel.fromJson(doc.data() as Map<String, dynamic>, doc.id);
      }).toList();
      tasks.sort((a, b) => DateTime.parse(a!.createdAt!)
          .compareTo(DateTime.parse(b!.createdAt!)));
      return tasks;
    } catch (e) {
      debugPrint("Error fetching tasks: $e");
      rethrow;
    }
  }

  Future<void> deleteTaskForEmail(String taskId, String email) async {
    try {
      await usersCollection.doc(email).collection('tasks').doc(taskId).delete();
    } catch (e) {
      debugPrint("Error deleting task: $e");
      rethrow;
    }
  }
}
