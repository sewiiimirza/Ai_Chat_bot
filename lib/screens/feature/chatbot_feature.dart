import 'package:ai_chat_bot/controller/chat_controllere.dart';
import 'package:ai_chat_bot/helper/global.dart';
import 'package:ai_chat_bot/main.dart';
import 'package:ai_chat_bot/widget/message_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ChatBotFeature extends StatefulWidget {
  const ChatBotFeature({super.key});

  @override
  State<ChatBotFeature> createState() => _ChatBotFeatureState();
}

class _ChatBotFeatureState extends State<ChatBotFeature> {
  //you can put the controller in one screen and access it anywhere
  final _c =ChatController();
 // final find=Get.find<ChatController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Chat with AI ChatBot"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton:
        Padding(padding:EdgeInsets.symmetric(horizontal: 8),
         child: Row(
        children: [
          Expanded(
              child: TextFormField(
                //so we can access all the data from textform
                controller: _c.textC,
                textAlign: TextAlign.center,
                onTapOutside: (e)=>FocusScope.of(context).unfocus(),
                decoration: InputDecoration(
                  fillColor: Theme.of(context).scaffoldBackgroundColor,
                  filled:true,
                  isDense: true,
                  hintText: "Ask me anything you want....",
                  hintStyle: TextStyle(fontSize: 14,),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50),),
                    borderSide: BorderSide(
                      style: BorderStyle.solid,color: Colors.grey,
                     ),

                  ),
                ),
              )),
          //for adding some space
          SizedBox(width: 8,),
          CircleAvatar(
            radius: 24,
            backgroundColor: Theme.of(context).buttonColor ,
            child: IconButton(
              onPressed: (){
                _c.askQuestion();
              },
              icon:Icon(
                 Icons.rocket_launch_rounded,
                 color:Colors.white,
               size: 29,),
            ),),
        ],
      ),
        ),
      body:Obx(
        ()=> ListView(
          controller: _c.scrollC,
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.only(top: mq.height*.02,bottom: mq.height*.01),
          children:
           _c.list.map((e) => MessageCard(message: e)).toList(),
        ),
      ),
    );
  }
}
