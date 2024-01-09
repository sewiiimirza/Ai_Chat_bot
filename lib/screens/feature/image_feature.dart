import 'package:ai_chat_bot/controller/image_ccontroller.dart';
import 'package:ai_chat_bot/helper/global.dart';
import 'package:ai_chat_bot/widget/custom_btn.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
class ImageFeature extends StatefulWidget {
  const ImageFeature({super.key});

  @override
  State<ImageFeature> createState() => _ImageFeatureState();
}

class _ImageFeatureState extends State<ImageFeature> {
  final _c= ImageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("AI Image Creator"),
      ),
      body:ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(top: mq.height*.02,left: mq.width*.04,right: mq.width*.04),
        children: [
          //text field
          TextFormField(
            //so we can access all the data from text form
          controller: _c.textC,
            textAlign: TextAlign.center,
            maxLines: null,
            minLines: 2,
            onTapOutside: (e)=>FocusScope.of(context).unfocus(),
            decoration:const InputDecoration(
              hintText: "Imagine something wonderfull & innovative\nType here and I will create for you😃",
              hintStyle: TextStyle(fontSize: 14,),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                  style: BorderStyle.solid,color: Colors.grey,
                ),
              )),
          ),

          //ai image
          Container(
            height: mq.height*.5,
           alignment: Alignment.center,
            child: Lottie.asset("assets/lottie/ai_play.json",height: mq.height*.3),//.3 mean 30 %of screen
          ),

          //create btn

          CustomBtn(onTap:(){} , text:"Create",),

        ],
      ),
    );
  }
}
