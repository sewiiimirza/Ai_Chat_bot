import 'package:flutter/material.dart';
class ChatBotFeature extends StatefulWidget {
  const ChatBotFeature({super.key});

  @override
  State<ChatBotFeature> createState() => _ChatBotFeatureState();
}

class _ChatBotFeatureState extends State<ChatBotFeature> {
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
                textAlign: TextAlign.center,
                onTapOutside: (e)=>FocusScope.of(context).unfocus(),
                decoration: InputDecoration(
                  isDense: true,
                  hintText: "Ask me anything you want....",
                  hintStyle: TextStyle(fontSize: 14),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    borderSide: BorderSide(color: Colors.grey),

                  ),
                ),
              )),
          //for adding some space
          SizedBox(width: 8,),
          CircleAvatar(
            radius: 24,
            child: IconButton(
              onPressed: (){},
                color: Colors.blueAccent,
               icon:Icon(
                Icons.rocket_launch_rounded,
                 color: Colors.white,size: 28,),
            ),),
        ],
      ),
        ),
      body:ListView(
        children: [
          ],
      ),
    );
  }
}
