import 'package:ai_chat_bot/helper/pref.dart';
import 'package:ai_chat_bot/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

void main()async  {
  WidgetsFlutterBinding.ensureInitialized();
  //hive initialize
  Pref.initialize();
  await  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
       theme: ThemeData(
        appBarTheme:AppBarTheme(
          elevation: 2,
          iconTheme: IconThemeData(color: Colors.blueAccent),
       backgroundColor: Colors.white,
         centerTitle:true,
       //  title:Text("Ai Chatbot",
         titleTextStyle: TextStyle(fontSize: 21,
             fontWeight: FontWeight.w600,
             color: Colors.blueAccent),),
         useMaterial3: true,
        ),

      //  colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),

      home: SplashScreen(),
    );
  }

}
