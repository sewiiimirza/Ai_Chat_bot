import 'package:ai_chat_bot/helper/global.dart';
import 'package:ai_chat_bot/screens/home_screen.dart';
import 'package:flutter/material.dart';
class CustomBtn extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  const CustomBtn({super.key, required this.onTap,required this.text,});

  @override
  Widget build(BuildContext context) {
    return Align(
     child: ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent,
          elevation: 0,
          minimumSize: Size(mq.width*.4, 50)
      ),
      onPressed: onTap,
      child: Text(text ,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.white)),),
    );



  }
}
