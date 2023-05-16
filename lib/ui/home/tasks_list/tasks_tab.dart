import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo/database/my_database.dart';
import 'package:todo/ui/home/tasks_list/tasks_item.dart';

import '../../../database/task.dart';

class TasksTab extends StatefulWidget {
  static const String screenName = "tasksTab";

  const TasksTab({super.key});

  @override
  State<TasksTab> createState() => _TasksTabState();
}

class _TasksTabState extends State<TasksTab> {
  List<Task> allTasks = [];

  @override
  void initState() {
    super.initState();
    loadTasks();
  }

  var selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CalendarTimeline(
          initialDate: selectedDate,
          firstDate: DateTime.now().subtract(const Duration(days: 365)),
          lastDate: DateTime.now().add(const Duration(days: 365)),
          onDateSelected: (date) {
            setState(() {
              selectedDate = date;
            });
          },
          leftMargin: 20,
          monthColor: Theme.of(context).colorScheme.background,
          dayColor: Theme.of(context).colorScheme.background,
          activeDayColor: Theme.of(context).primaryColor,
          activeBackgroundDayColor: Colors.white,
          dotsColor: Theme.of(context).primaryColor,
          selectableDayPredicate: (date) => true,
          locale: 'en_ISO',
        ),
        Expanded(
            child: StreamBuilder<QuerySnapshot<Task>>(
                stream: MyDatabase.getTasksRealTimeUpdates(selectedDate),
                builder: (__, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return const Center(
                      child: Column(
                        children: [
                          Text('Error Loading tasks,'
                              ' Try Again Later'),
                        ],
                      ),
                    );
                  }
                  var tasks =
                      snapshot.data?.docs.map((doc) => doc.data()).toList();
                  return ListView.builder(
                    itemBuilder: (_, index) {
                      return TasksItem(tasks![index]);
                    },
                    itemCount: tasks?.length ?? 0,
                  );
                }))
      ],
    );
  }

  void loadTasks() async {
    allTasks = await MyDatabase.getTasks(selectedDate);
    setState(() {});
  }
}
