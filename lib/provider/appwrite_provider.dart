import 'package:appwrite/appwrite.dart';

class AppwriteProvider{
  Client client = Client();
  AppwriteProvider(){
    client
        .setEndpoint('https://cloud.appwrite.io/v1')
        .setProject('64f2250bf1ebe2e391ad')
        .setSelfSigned(status: true);
  }
}