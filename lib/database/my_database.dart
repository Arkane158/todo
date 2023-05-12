import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/database/task.dart';
import 'package:todo/utils/date_utils.dart';

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
    task.dateTime = task.dateTime.extractDateOnly();
    return doc.set(task);
  }

  static Future<List<Task>> getTasks(DateTime dateTime) async {
    var quereSnapshot = await getTasksCollection()
        .where('dateTime',
            isEqualTo: dateTime.extractDateOnly().millisecondsSinceEpoch)
        .get();
    var tasksList = quereSnapshot.docs.map((doc) => doc.data()).toList();
    return tasksList;
  }

  static Future<QuerySnapshot<Task>> getTaskFuture(DateTime dateTime) {
    return getTasksCollection()
        .where('dateTime',
            isEqualTo: dateTime.extractDateOnly().millisecondsSinceEpoch)
        .get();
  }

  static Stream<QuerySnapshot<Task>> getTasksRealTimeUpdates(
      DateTime dateTime) {
    return getTasksCollection()
        .where('dateTime',
            isEqualTo: dateTime.extractDateOnly().millisecondsSinceEpoch)
        .snapshots();
  }

  static Future<void> deleteTask(Task task) {
    var taskDoc = getTasksCollection().doc(task.id);
    return taskDoc.delete();
  }
}
