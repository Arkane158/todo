import 'package:flutter/material.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Form(
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Center(
              child: Text(
            'Add New Task',
            style: Theme.of(context).textTheme.displayLarge,
          )),
          TextFormField(
            decoration: const InputDecoration(labelText: "Tittle"),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: "Describtion"),
          ),
          const SizedBox(
            height: 20,
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
                '12/12/2012',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Theme.of(context).primaryColor),
              ),
            ),
          ),
          ElevatedButton(onPressed: () {}, child: const Text('submit'))
        ]),
      ),
    );
  }

  void showTaskDatePicker() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 365)));
  }
}
