import 'package:flutter/material.dart';
import 'package:todo/database/my_database.dart';
import 'package:todo/utils/date_utils.dart';
import 'package:todo/utils/dialoge_utils.dart';

import '../../../database/task.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  var formKey = GlobalKey<FormState>();
  var tittleController = TextEditingController();
  var descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: formKey,
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Center(
              child: Text(
            'Add New Task',
            style: Theme.of(context).textTheme.displayLarge,
          )),
          TextFormField(
            decoration: const InputDecoration(labelText: "Tittle"),
            controller: tittleController,
            validator: (input) {
              if (input == null || input.trim().isEmpty) {
                return 'Please enter a valid Tittle';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            minLines: 2,
            maxLines: 2,
            decoration: const InputDecoration(labelText: "Describtion"),
            controller: descriptionController,
            validator: (input) {
              if (input == null || input.trim().isEmpty) {
                return 'Please enter a valid description';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Selected Date',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: showTaskDatePicker,
              child: Text(
                MyDateUtils.formatTaskDate(selectedDate),
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Theme.of(context).primaryColor),
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                insertTask();
              },
              child: const Text('submit'))
        ]),
      ),
    );
  }

  var selectedDate = DateTime.now();
  void showTaskDatePicker() async {
    var userSelectedDate = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 365)));
    if (userSelectedDate == null) {
      return;
    }
    setState(() {
      selectedDate = userSelectedDate;
    });
  }

  Future<void> insertTask() async {
    if (formKey.currentState?.validate() == false) {
      return;
    }
    Task task = Task(
        tittle: tittleController.text,
        description: descriptionController.text,
        dateTime: selectedDate);
    DialogeUtils.showProgressDialog(context, 'Loading...',
        isDismissible: false);
    await MyDatabase.insertTask(task);
    DialogeUtils.hideDialog(context);

    DialogeUtils.showMessage(context, 'Task Inserted Successfully',
        posActionTitle: 'Ok', posAction: () {
      Navigator.pop(context);
       Navigator.pop(context);
    });
  }
}
