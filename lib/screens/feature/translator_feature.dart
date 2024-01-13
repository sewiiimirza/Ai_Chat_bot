import 'package:ai_chat_bot/controller/translator_controller.dart';
import 'package:ai_chat_bot/helper/global.dart';
import 'package:ai_chat_bot/widget/custom_btn.dart';
import 'package:ai_chat_bot/widget/language_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class TranslatorFeature extends StatefulWidget {
  const TranslatorFeature({super.key});

  @override
  State<TranslatorFeature> createState() => _TranslatorFeatureState();
}

class _TranslatorFeatureState extends State<TranslatorFeature> {
  final _c = TranslatorController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Multi Language Translator"),
      ),
      body:ListView(
        physics: BouncingScrollPhysics(),
       padding: EdgeInsets.only(top: mq.height*.02,bottom: mq.height*.1),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
        children:[

          //from language
          InkWell(
              onTap: ()=>Get.bottomSheet(LanguageSheet()),
          child:Container(
          height: 50,
             width: mq.width*.4,
           alignment: Alignment.center,
           decoration: BoxDecoration(
             border: Border.all(color:Colors.blueAccent),
             borderRadius: BorderRadius.all(Radius.circular(15)),
           ),
           child: Text('Auto'),
         ),
    ),


          //swipe language btn
          IconButton(onPressed: (){},
              icon: Icon(CupertinoIcons.repeat,
                color: Colors.grey,)),


          // to language
          Container(
            height: 50,
            width: mq.width*.4,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(color:Colors.blueAccent),
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            child: Text('To'),
          ),
          ],
          ),


          //text field
          Padding(padding:
          EdgeInsets.symmetric(horizontal:mq.width*.035,vertical: mq.height*.035),
          child:TextFormField(
            //so we can access all the data from text form
            controller: _c.textC,
            maxLines: null,
            minLines: 5,
            onTapOutside: (e)=>FocusScope.of(context).unfocus(),
            decoration:const InputDecoration(
                hintText: "Translate anything you want...",
                hintStyle: TextStyle(fontSize: 15,),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(
                    style: BorderStyle.solid,color: Colors.grey,),)),
          )),

          //result field
          if(_c.resultC.text.isNotEmpty)
          Padding(padding:
          EdgeInsets.symmetric(horizontal:mq.width*.035,),
              child:TextFormField(
                //so we can access all the data from text form
                controller: _c.resultC,
                maxLines: null,
                // minLines: 5,
                onTapOutside: (e)=>FocusScope.of(context).unfocus(),
                decoration:const InputDecoration(
                    hintText: "result...",
                    hintStyle: TextStyle(fontSize: 15,),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        style: BorderStyle.solid,color: Colors.grey,),)),
              )),

          SizedBox(height: mq.height*.04,),
          CustomBtn(onTap: (){}, text:"Translate")
        ],
      ),



    );


  }
}
