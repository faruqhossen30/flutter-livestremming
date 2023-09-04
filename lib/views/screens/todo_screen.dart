import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:livestreaming/service/todo_service.dart';
import 'package:livestreaming/views/screens/test_screen.dart';

// Your project ID

class TodoScreen extends StatefulWidget {
  TodoScreen({Key? key}) : super(key: key);

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  void initState() {
    // TODO: implement initState
    TodoService().getTodos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text('welcome'),
            TextButton(
              onPressed: (){
                TodoService().createTodo();
                setState(() {

                });
              },
              child: Text('Create Todo'),
            ),
            FutureBuilder(
              future: TodoService().getTodos(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Text('No data');
                }

                return Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index){
                      return ListTile(
                        title: Text(snapshot.data[index].data['description'].toString()),
                        leading: Icon(Icons.list),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
