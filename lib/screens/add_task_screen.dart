import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/task_data.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var taskData = Provider.of<TaskData>(context);
    bool editMode = taskData.editIndex != -1;
    String todoText = editMode ? taskData.tasks[taskData.editIndex].name : null;

    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Form(
          key: _formKey,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  "${editMode ? 'Update' : 'Add'} Task",
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(fontSize: 30.0, color: Colors.lightBlueAccent),
                ),
                TextFormField(
                  initialValue: todoText,
                  autofocus: true,
                  textCapitalization: TextCapitalization.sentences,
                  textAlign: TextAlign.center,
                  onChanged: (newText) {
                    todoText = newText;
                  },
                  validator: (value) {
                    if (value.trim().isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 5.0),
                FlatButton(
                    child: Text(
                      "${editMode ? 'Update' : 'Add'}",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.lightBlueAccent,
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        editMode
                            ? taskData.updateTask(todoText)
                            : taskData.addTask(todoText);
                        Navigator.pop(context);
                      }
                    })
              ]),
        ),
      ),
    );
  }
}
