import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/task_data.dart';
import 'package:todo_app/widgets/task_tile.dart';

class TasksList extends StatelessWidget {
  final Function onPressed;

  TasksList(this.onPressed);

  @override
  Widget build(BuildContext context) {
    var taskData = Provider.of<TaskData>(context);
    return ListView.builder(
      itemBuilder: (context, index) {
        var task = taskData.tasks[index];
        return TaskTile(
          taskTitle: task.name,
          isChecked: task.isDone,
          checkboxCallback: (status) => taskData.updateCheckbox(status, index),
          onDelete: () {
            showDialog(
                context: context,
                builder: (_) => AlertDialog(
                      title: Text("Delete Todo"),
                      content: Text('Are you sure?'),
                      actions: [
                        FlatButton(
                          child: Text('Yes'),
                          onPressed: () {
                            taskData.deleteTask(index);
                            Navigator.of(context).pop();
                          },
                        ),
                        FlatButton(
                          child: Text('No'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        )
                      ],
                    ),
                barrierDismissible: false);
          },
          onEdit: () {
            taskData.setEditIndex(index);
            onPressed();
          },
        );
      },
      itemCount: taskData.tasks.length,
    );
  }
}
