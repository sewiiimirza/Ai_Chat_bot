
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:ai_chat_bot/helper/global.dart';
import 'package:http/http.dart';

class APIs{
  //get answer from chatGpt
     static Future<String>  getAnswer(String question)async {
        //post method when we have some data to send and want some response
        try{
          final res =
          await post(Uri.parse('https://api.openai.com/v1/chat/completions'),

              //headers
              headers:{
                HttpHeaders.contentTypeHeader:'application/json',
                HttpHeaders.authorizationHeader:'Bearer $apiKey'
              },
              //body
              body:jsonEncode({
                "model": "gpt-3.5-turbo",
                "max_tokens":2000,
                "temperature":0,
                "messages": [
                  {"role": "user", "content":question},
                ],
              }));
          final data= jsonDecode(res.body);
          log('res : $data');
          return data['choices'][0]['message']['content'];
        }catch(e){
          log('getAnswerE:$e');
          return 'Something went wrong(Try again in something)';
        }
}
}