import 'package:ai_chat_bot/helper/global.dart';
import 'package:ai_chat_bot/model/onboard.dart';
import 'package:ai_chat_bot/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c= PageController();//create
    final list=[Onboard(title: "Ask me Anything", subtitle:
    "I can be your best Friend & You can ask me anything &i will help you!",
        lottie: "ai_ask_me"),
      //onboarding 2
      Onboard(title: "Imagination to Reality",
          subtitle:"Just Imagine anything & let me know,I will create something wonderful for you",
          lottie:"ai_play"),
      
    ];
    return Scaffold(
      body:PageView.builder(
        //initialize controller
        controller: c,
        itemCount: list.length,
      itemBuilder: (ctx ,ind){
        final isLast =ind==list.length-1;
            return  Column(
              children: [
                Lottie.asset("assets/lottie/${list[ind].lottie}.json",width:isLast?mq.width*.7:null,
                    height: mq.height*.6),
                //title
                Text(list[ind].title,
                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900,letterSpacing: .5),),

                //for adding some space
                SizedBox(height: mq.height*.01,),

                //subtitle
                SizedBox(width: mq.width*.7,
                  child: Text(list[ind].subtitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18,letterSpacing: .5,color: Colors.black54),
                  ),),


                const Spacer(),

                //dots
                Wrap(
                    spacing:10,
                    children:List.generate(list.length, (i) => Container(
                      width: i==ind ?15:10,
                      height: 8,
                      decoration: BoxDecoration(
                          color:  i== ind? Colors.blueAccent: Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                    ))),
                const Spacer(),

                //button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent,elevation: 0,
                    minimumSize: Size(mq.width*.4, 50)
                    ),
                  onPressed: (){
                    if(isLast){
                      Get.off(()=>HomeScreen());
                    //  Navigator.of(context).pushReplacement( MaterialPageRoute(builder: (_)=>HomeScreen()));
;
                    }else{
                      c.nextPage(duration:const  Duration(milliseconds: 600),
                          curve: Curves.ease);

                    }
                    }, child: Text( isLast? "Finish":"Next",
                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.white)),
                ),
                const  Spacer(),
              ],

            );

          }),
    );
  }
}
