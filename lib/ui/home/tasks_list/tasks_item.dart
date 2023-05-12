// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo/database/my_database.dart';
import 'package:todo/utils/dialoge_utils.dart';

import '../../../database/task.dart';

class TasksItem extends StatefulWidget {
  Task task;
  TasksItem(this.task);

  @override
  State<TasksItem> createState() => _TasksItemState();
}

class _TasksItemState extends State<TasksItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18), color: Colors.red),
      child: Slidable(
        startActionPane: ActionPane(
            extentRatio: .2,
            motion: const DrawerMotion(),
            children: [
              SlidableAction(
                onPressed: (__) {
                  deleteTask();
                },
                backgroundColor: Colors.red,
                icon: Icons.delete,
                label: 'Delete',
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(18),
                  bottomLeft: Radius.circular(18),
                ),
              )
            ]),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 27, horizontal: 18),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(18)),
          child: Row(
            children: [
              Container(
                height: 80,
                width: 5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: Theme.of(context).primaryColor),
              ),
              Expanded(
                  child: Column(
                children: [
                  Text(
                    widget.task.tittle,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(widget.task.description,
                      style: Theme.of(context).textTheme.titleSmall)
                ],
              )),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: const Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 32,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void deleteTask() {
    DialogeUtils.showMessage(
        context, 'Are you sure you want to delete this task?',
        posActionTitle: 'yes',
        posAction: () async {
          DialogeUtils.showProgressDialog(context, 'Loading...');
          await MyDatabase.deleteTask(widget.task);
          DialogeUtils.hideDialog(context);
          DialogeUtils.showMessage(context, 'Task Deleted successfully',
              posActionTitle: 'oK', negActionTitle: 'Undo', negAction: () {});
        },
        negActionTitle: 'Cancel',
        negAction: () {
          DialogeUtils.hideDialog(context);
        });
  }
}
