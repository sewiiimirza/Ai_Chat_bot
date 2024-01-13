import 'package:ai_chat_bot/apis/apis.dart';
import 'package:ai_chat_bot/helper/my_dialog.dart';
import 'package:ai_chat_bot/model/message.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChatController  extends GetxController{
    final textC= TextEditingController();
    final scrollC = ScrollController();

    //list save the current msgs and observe new item list and will be updated
    final list =<Message>[Message(msg:'Hello,How can I help you?',msgType: MessageType.bot)].obs;

    //trim removes the spaces
    //function askQuestion
    Future<void> askQuestion()async {
        if (textC.text.trim().isNotEmpty) {
            //for user
            list.add(Message(msg: textC.text, msgType: MessageType.user));
            //dummy msg till response
            list.add(Message(msg: '', msgType: MessageType.bot));
            _scrollDown();

            final res = await APIs.getAnswer(textC.text);


            //ai bot
            list.removeLast();
            list.add(Message(msg: res, msgType: MessageType.bot));

            textC.text = '';
        }else{
            MyDialog.info('Ask something!');
        }
    }
            //moving to end message
            void _scrollDown(){
                scrollC.animateTo(scrollC.position.minScrollExtent, duration:Duration(milliseconds: 500),
                    curve: Curves.ease);
            }
    }
