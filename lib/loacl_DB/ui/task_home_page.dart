import 'package:flutter/material.dart';
import 'package:task_adder_app/loacl_DB/DB/task_database.dart';
import 'package:task_adder_app/loacl_DB/model/task_model.dart';
class TaskHomePage extends StatefulWidget {
  const TaskHomePage({super.key});
  @override
  State<TaskHomePage> createState() => _TaskHomePageState();
}
class _TaskHomePageState extends State<TaskHomePage> {
  List<Task> tasks = [];
  TextEditingController taskController = TextEditingController();
  @override
  void initState() {
    super.initState();
    refreshTask();
    // Load tasks from local database or any other source
  }

  Future<void>refreshTask() async{
    tasks = await TaskDatabase.getTask();
    setState((){

    });
  }

  Future<void>addTask() async{
    if(taskController.text.isNotEmpty){
    await TaskDatabase.insertTask(Task(title: taskController.text, isDone: false));
    taskController.clear();
    refreshTask();
    }else{

    }
  }

  Future<void>deleteTask(int id) async{
    await TaskDatabase.deleteTask(id);
    refreshTask();

  }

  Future<void>toggleTask(Task task) async{
    TaskDatabase.updateTask(Task(id: task.id, title: task.title, isDone: !task.isDone));
    refreshTask();
  }

  Future<void> editTask (Task task) async {
    TextEditingController editingController = TextEditingController();
    editingController.text = task.title;
    showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        title: Text('Edit task'),
        content: TextField(
          controller: editingController,
          decoration: InputDecoration(hintText: 'Edit Task', border: OutlineInputBorder()),
        ),
        actions: [
          TextButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text('Cancel')),

          TextButton(onPressed: (){
            TaskDatabase.updateTask(Task(title: editingController.text, isDone: task.isDone, id: task.id));
            refreshTask();
            editingController.clear();
            Navigator.pop(context);
          }, child: Text("Save"))
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Task Adder", style: TextStyle(fontWeight: .bold),),
        backgroundColor: Colors.lightGreenAccent,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
              Expanded(child: TextField(
                controller: taskController,
                decoration: InputDecoration(
                  hint: Text("Enter Text"),
                  border: OutlineInputBorder(),
                ),
              )),
                IconButton(onPressed: (){
                  addTask();
                }, icon: Icon(Icons.add)),
              ],
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
                itemBuilder: (context, index){
                  final task = tasks[index];
                return ListTile(
                  leading: Checkbox(value: task.isDone, onChanged: (_){
                    toggleTask(task);
                  }),
                  title: Text(task.title),
                  trailing: Row(
                    mainAxisSize: .min,
                    children: [
                      IconButton(onPressed: ()=>editTask(task), icon: Icon(Icons.edit, color: Colors.orange,)),
                      IconButton(onPressed: (){
                        deleteTask(task.id!);
                      }, icon: Icon(Icons.delete, color: Colors.red,)),
                    ],
                  ),
                );
                }
            ),
          ),
        ],
      ),
    );
  }
}
