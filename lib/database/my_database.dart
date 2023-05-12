import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/database/task.dart';

class MyDatabase {
  static CollectionReference<Task> getTasksCollection() {
    var tasksCollection = FirebaseFirestore.instance
        .collection('tasks')
        .withConverter<Task>(
            fromFirestore: ((snapshot, options) =>
                Task.fromFirestore(snapshot.data()!)),
            toFirestore: (task, options) => task.toFirestore());
    return tasksCollection;
  }

  static Future<void> insertTask(Task task) {
    var tasksCollection = getTasksCollection();

    var doc = tasksCollection.doc();
    task.id = doc.id;
    return doc.set(task);
  }

  static Future<List<Task>> getTasks() async {
    var quereSnapshot = await getTasksCollection().get();
    var tasksList = quereSnapshot.docs.map((doc) => doc.data()).toList();
    return tasksList;
  }

  static Stream<QuerySnapshot<Task>> getTasksRealTimeUpdates() {
    return getTasksCollection().snapshots();
  }

  static Future<void> deleteTask(Task task) {
    var taskDoc = getTasksCollection().doc(task.id);
    return taskDoc.delete();
  }
}
