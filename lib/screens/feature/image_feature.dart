import 'package:ai_chat_bot/controller/image_controller.dart';
import 'package:ai_chat_bot/helper/global.dart';
import 'package:ai_chat_bot/widget/custom_btn.dart';
import 'package:ai_chat_bot/widget/custome_loading.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
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

        //share btn
        actions: [
          Obx(()=> _c.status.value== Status.complete ?
          IconButton(
          padding:EdgeInsets.only(right: 10),
              onPressed: _c.shareImage,
              icon:Icon(Icons.share_rounded,size: 25,))
              :SizedBox(),
          ),
        ],
      ),


      //download btn
      floatingActionButton:Obx(()=>_c.status.value == Status.complete ?
        Padding(
            padding: EdgeInsets.only(right: 6,bottom: 6,),
            child:FloatingActionButton(
              backgroundColor: Colors.blueAccent,
          onPressed: _c.downloadImage,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),),
              child: Icon(Icons.save_alt_outlined,size: 28,color: Colors.white,),
        ),
        )
          :SizedBox()),




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
            child:
              Obx(() => _aiImage(),),
          ),

            //create btn
            CustomBtn(onTap:_c.createAIImage , text:"Create",),

        ],
      ),
    );
  }
//_mean private
  Widget _aiImage()=> switch(_c.status.value){
    Status.none=>
        Lottie.asset("assets/lottie/ai_play.json", height:mq.height * .3 ),//.3 mean 30 %of screen
     Status.complete=> ClipRRect(
       borderRadius: BorderRadius.all(Radius.circular(10)),
       child: CachedNetworkImage(
         imageUrl: _c.url,
         placeholder: (context, url) => CustomLoading(),
         errorWidget: (context, url, error) => SizedBox(),
         ),
     ),
  Status.loading=>CustomLoading(),
};
}
