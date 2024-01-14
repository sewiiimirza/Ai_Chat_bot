
import 'dart:developer';

import 'package:ai_chat_bot/helper/global.dart';
import 'package:appwrite/appwrite.dart';
class AppWrite{
   static final  _client= Client();
   static final  _database=Databases(_client);
    static void init() {
    _client
      .setEndpoint('https://cloud.appwrite.io/v1')
      .setProject('65a3dc8b9fe9de7a6e1d')
      .setSelfSigned(status: true);
    getApiKey();
  }
    static Future<String>getApiKey() async{
      try{
        final d=await _database.getDocument(
            databaseId: 'AiChatbotDatabase',
            collectionId: 'ApiKey',
            documentId:'chatGptKey');
          apiKey=d.data['apiKey'];
        log( apiKey);
        return apiKey;
      }catch(e){
       log('$e');
        return'';
      }
    }
}