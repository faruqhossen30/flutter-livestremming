import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:livestreaming/service/todo_service.dart';
import 'package:livestreaming/views/screens/todo_screen.dart';

// Your project ID

class TestScreen extends StatefulWidget {
  TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {

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
            Text('Test Screen'),
            TextButton(
              onPressed: (){
                Get.offAll(()=>TodoScreen());
              },
              child: Text('Go to Todo screen'),
            )
          ],
        ),
      ),
    );
  }
}
