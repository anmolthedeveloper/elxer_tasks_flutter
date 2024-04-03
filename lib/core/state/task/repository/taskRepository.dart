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
      throw e;
    }
  }
}
