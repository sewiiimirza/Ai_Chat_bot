import 'package:ai_chat_bot/helper/global.dart';
import 'package:ai_chat_bot/model/home_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';

class HomeCard extends StatelessWidget {
  final HomeType homeType;
  const HomeCard({super.key, required this.homeType});

  @override
  Widget build(BuildContext context) {
    Animate.restartOnHotReload=true;
    return Card(
      color: Colors.blueAccent.withOpacity(.3),
      elevation: 0,
      margin: EdgeInsets.only(bottom: mq.height * .02),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: homeType.leftAlign
          ? Row(
              children: [
                Container(
                  width: mq.width * .35,
                  padding: homeType.padding,
                  child: Lottie.asset(
                    "assets/lottie/${homeType.lottie}",
                  ),
                ),

                const Spacer(),

                //title
                Text(
                  homeType.title,
                  style: const TextStyle(
                      fontSize: 24,
                      wordSpacing: 1,
                      fontWeight: FontWeight.w500),
                ),

                const Spacer(
                  flex: 2,
                ),
              ],
            )
          : Row(
              children: [
                const Spacer(),

                //title
                Text(
                  homeType.title,
                  style: const TextStyle(
                      fontSize: 24,
                      wordSpacing: 1,
                      fontWeight: FontWeight.w500),
                ),

                //lottie
                Container(
                  width: mq.width * .35,
                  padding: homeType.padding,
                  child: Lottie.asset(
                    "assets/lottie/${homeType.lottie}",
                  ),
                ),
              ],
            ),
    ).animate().fade(duration: 2.seconds,curve: Curves.easeIn);
  }
}
