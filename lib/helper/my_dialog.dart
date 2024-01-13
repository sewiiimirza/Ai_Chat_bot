

 import 'package:ai_chat_bot/widget/custome_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyDialog{
  //info
   static void info(String msg){
      Get.snackbar('Info', msg,backgroundColor: Colors.blue.withOpacity(.8,),
      colorText: Colors.white);
   }
   //success
   static void success(String msg){
     Get.snackbar('Info', msg,backgroundColor: Colors.green.withOpacity(.8,),
         colorText: Colors.white);
   }

//error
  static void error(String msg){
    Get.snackbar('Info', msg,backgroundColor: Colors.redAccent.withOpacity(.8,),
        colorText: Colors.white);
  }
//error
  static void showLoadingDialog(){
    Get.dialog(const Center(child:CustomLoading()));
  }

}