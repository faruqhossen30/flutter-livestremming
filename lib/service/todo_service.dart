import 'dart:math';

import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:get/get.dart';
import 'package:livestreaming/const/appwrite_const.dart';
import 'package:livestreaming/db/db_todo.dart';
import 'package:livestreaming/models/todo_model.dart';
Client client = Client()
    .setEndpoint(AppwriteConst.endPoint) // Your Appwrite Endpoint
    .setProject(AppwriteConst.projectId);

class TodoService{
Databases db = Databases(client);
    List<Document> todos = [];

Future getTodos()async{
  try {
    DocumentList documents = await db.listDocuments(databaseId: '64f2252362db5b8800a3', collectionId: '64f53f0432781f1e4a51');
    return documents.documents;

  } on AppwriteException catch(e) {
    print('this is error');
    print(e);
  }
}
Future<void> createTodo()async{
  try {
    final document = await db.createDocument(
        databaseId: '64f2252362db5b8800a3', collectionId: '64f53f0432781f1e4a51',
        documentId: ID.unique(),
        data: {
          "id":4,
          "title":"Just for test",
          "description":"This is ${Random().nextInt(2000).toString()}",
        }
    );
  } on AppwriteException catch(e) {
    print(e);
  }
}



}