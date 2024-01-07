import 'package:ai_chat_bot/helper/global.dart';
import 'package:ai_chat_bot/helper/pref.dart';
import 'package:ai_chat_bot/model/home_type.dart';
import 'package:ai_chat_bot/widget/home_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    Pref.showOnboarding=false;
  }
  @override
  Widget build(BuildContext context) {
    //initializing device size
   // mq =MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle:true,
        title:Text("Ai Chatbot",style: TextStyle(
            fontWeight: FontWeight.w900,
            color: Colors.blueAccent),),
        elevation: 2,
        actions: [
          IconButton(
              padding: EdgeInsets.only(right: 10),
          onPressed: (){},
             icon:Icon(Icons.brightness_4,color: Colors.blueAccent,size: 27))],
      ),
      body:SafeArea(
        child:Center(
        child:ListView(
          padding: EdgeInsets.symmetric(horizontal: mq.width*.04,vertical: mq.height*.015),
          children:
            HomeType.values.map((e)=>HomeCard(homeType: e,)).toList(),
        ),


        ),
      ),
    );
  }
}