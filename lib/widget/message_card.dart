import 'package:ai_chat_bot/helper/global.dart';
import 'package:ai_chat_bot/main.dart';
import 'package:ai_chat_bot/model/message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
class MessageCard extends StatelessWidget {
  final Message message;
  const MessageCard({super.key,required this.message});
  @override
  Widget build(BuildContext context) {
        const r= Radius.circular(15);
    return  message.msgType==MessageType.bot

    //for bot
        ? Row(
      children:[
        SizedBox(width: 6,),
        CircleAvatar(
          backgroundColor: Colors.white,
          radius: 18,
          child:Image.asset("assets/images/logo.png",width: 27,),
        ),
        Container(
          constraints: BoxConstraints(maxWidth: mq.width*.6),
          margin: EdgeInsets.only(
              bottom:mq.height *.02,left: mq.width*.02),
          padding: EdgeInsets.symmetric(
              horizontal: mq.width*.02 ,vertical: mq.height*.01),
          decoration:BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: r,topRight: r,bottomRight: r),
            border: Border.all(color: Theme.of(context).lightTextColor),),
          child:message.msg.isEmpty ? AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText(
                'Please wait...',
                speed: const Duration(milliseconds: 100),
              ),
            ],
            repeatForever: true,
          ):Text(message.msg,
            textAlign: TextAlign.center,)
          ),


         ])
    // for user
        :Row(
      mainAxisAlignment: MainAxisAlignment.end,
        children:[
          Container(
             constraints: BoxConstraints(maxWidth: mq.width*.6),
            margin: EdgeInsets.only(bottom: mq.height*.01,right: mq.width*.02),
            padding: EdgeInsets.symmetric(horizontal: mq.width*.03 ,vertical: mq.height*.01),
            decoration:BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: r,topRight: r,bottomRight: r),
              border: Border.all(color: Theme.of(context).lightTextColor),),
            child: Text(message.msg,textAlign: TextAlign.center,)),

            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 18,
              child:Icon(Icons.person,color: Colors.blueAccent,),
            ),
          SizedBox(width: 6,),



        ]);
  }
}
