import 'package:cloud_firestore/cloud_firestore.dart';

class TaskService {
  Stream<List<QueryDocumentSnapshot<Map<String, dynamic>>>> taskStreamer() {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final taskSnapshot = firestore.collection("tasks").snapshots().map((snapshot) =>snapshot.docs);
    return taskSnapshot;
  }
}