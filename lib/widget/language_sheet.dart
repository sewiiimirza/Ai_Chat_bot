import 'package:ai_chat_bot/controller/translator_controller.dart';
import 'package:ai_chat_bot/helper/global.dart';
import 'package:ai_chat_bot/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class LanguageSheet extends StatelessWidget {
   final TranslatorController c;
   final RxString s;
  const LanguageSheet({super.key, required this.c, required this.s});

  @override
  Widget build(BuildContext context) {
    final search=''.obs;
    return Container(
      padding: EdgeInsets.only(left: mq.width*.04,right: mq.width*.04,top: mq.height*.04),
      height: mq.height*.5,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.only(topRight: Radius.circular(15),topLeft: Radius.circular(15))
      ),
      child: Column(
        children: [
            TextFormField(
              onChanged: (s)=> search.value =s.toLowerCase() ,

            //so we can access all the data from text form
                   // controller: _c.textC,
            maxLines: null,
            onTapOutside: (e)=>FocusScope.of(context).unfocus(),
            decoration:InputDecoration(
                hintText: "Search language...",

                prefixIcon: Icon(Icons.translate_rounded,
                  color: Theme.of(context).buttonColor,
                  size:27 ,),
                hintStyle: TextStyle(fontSize: 15,),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                //  borderSide: BorderSide(
                  //  style: BorderStyle.solid,color: Colors.grey,),
                 )),
                  ),
             Expanded(
               child: Obx(
                  (){
                    final List<String>list=search.isEmpty? c.lang:c.lang.where((e)
                    =>e.toLowerCase().contains(search.value)).toList();
                    return ListView.builder(
                      physics: BouncingScrollPhysics(),
                           itemCount: list.length,
                           padding: EdgeInsets.only(
                               top: mq.height * .02, left: 6),
                           itemBuilder: (ctx, i) {
                             return InkWell(
                               onTap:() {
                                 s.value = list[i];
                                 Get.back();
                               },
                               child: Padding(
                                 padding: EdgeInsets.only(bottom: mq.height * .02),
                                 child: Text(list[i]),
                               ),
                             );
                           }
                       );
                   }
               ),

             )],
          ),

      );
  }
}
    
