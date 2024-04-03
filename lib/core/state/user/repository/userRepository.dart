import 'package:cloud_firestore/cloud_firestore.dart';

class UserRepository {
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

  Future<void> addUser(String name, String email) async {
    try {
      await usersCollection.doc(email).set({"name": name, "email": email});
    } catch (e) {
      print("Error adding user: $e");
      throw e;
    }
  }

  Future<bool> doesEmailExist(String email) async {
    try {
      final doc = await usersCollection.doc(email).get();
      return doc.exists;
    } catch (e) {
      print("Error checking user existence: $e");
      throw e;
    }
  }
}
