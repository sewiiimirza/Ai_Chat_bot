import 'package:flutter/cupertino.dart';

enum HomeType{ aiChatbot,aiImage,aiTranslator }

//custom extensions for the enum

extension MyHomeType on HomeType{
  //it return title depending upon the enum and this represent enum
  String get title=>switch(this){

    HomeType.aiChatbot =>"Ai ChatBot",
    HomeType.aiImage => "Ai Image Creator",
    HomeType.aiTranslator =>"Language Translator",
  };
  //lottie
  String get lottie=>switch(this){

    HomeType.aiChatbot =>"ai_hand_waving.json",
    HomeType.aiImage => "ai_play.json",
    HomeType.aiTranslator =>"ai_ask_me.json",
  };
  //for alignment
  bool get leftAlign=>switch(this){

    HomeType.aiChatbot =>true,
    HomeType.aiImage => false,
    HomeType.aiTranslator =>true,
  };
  //for padding
 EdgeInsets get padding =>switch(this){

    HomeType.aiChatbot =>EdgeInsets.zero,
    HomeType.aiImage => EdgeInsets.all(20),
    HomeType.aiTranslator =>EdgeInsets.zero,
  };
}
