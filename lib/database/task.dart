
class Task {
  String id;
  String tittle;
  String description;
  DateTime dateTime;
  bool isDone;
  Task({
    this.id='',
    required this.tittle,
    required this.description,
    required this.dateTime,
    this.isDone = false,
  });

  Task.fromFirestore(Map<String, dynamic> data):
    this(
      id: data['id'],
      tittle: data['tittle'],
      description: data['description'],
      dateTime: DateTime.fromMillisecondsSinceEpoch(data['dateTime']),
      isDone: data['isDone'],
    );
  

  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'tittle': tittle,
      'description': description,
      'dateTime': dateTime.millisecondsSinceEpoch,
      'isDone': isDone,
    };
  }
}
