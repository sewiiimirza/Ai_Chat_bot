
import 'package:ai_chat_bot/helper/global.dart';
import 'package:ai_chat_bot/helper/pref.dart';
import 'package:ai_chat_bot/screens/home_screen.dart';
import 'package:ai_chat_bot/screens/onboarding_screen.dart';
import 'package:ai_chat_bot/widget/custome_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  //function call when we build app first time
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration(seconds: 2),(){
      //   Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(_)=>
      //   Pref.showOnboarding? const OnboardingScreen():HomeScreen());
      //off similar to push replacement does not remove current screen just move to another sc
      Get.off(()=>Pref.showOnboarding? const OnboardingScreen():HomeScreen());
      } );

  }
  @override
  Widget build(BuildContext context) {
    //initializing device size
    mq =MediaQuery.sizeOf(context);
    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        child: Column(
          children: [
            Spacer(flex: 1,),
            Card(
              color: Colors.blue,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                  child:Padding(
                      padding:EdgeInsets.all(mq.width*.05),
                  child:Image.asset("assets/images/logo.png",
                    width:mq.width*.4 ,
                 )),

              ),
              //spacer it provide some  space to the stuff inside this column
           // Spacer(),
              //for lottie loading
              CustomLoading(),
            //for adding some space
            Spacer(),

          ],
        ),
      ),
    );
  }
}
