import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TasksItem extends StatelessWidget {
  const TasksItem({super.key});

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
                onPressed: (__) {},
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
                    'This is Tittle',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text('This is description',
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
}
