
import 'dart:developer';
import 'dart:io';
import 'package:ai_chat_bot/helper/global.dart';
import 'package:ai_chat_bot/helper/my_dialog.dart';
import 'package:dart_openai/dart_openai.dart';
import 'package:flutter/cupertino.dart';
import 'package:gallery_saver_updated/gallery_saver.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

enum Status { none,loading,complete}

class ImageController  extends GetxController{
  final textC= TextEditingController();

  final status= Status.none.obs;
  String url='';

  Future<void> createAIImage()async {
    OpenAI.apiKey = apiKey;
    if (textC.text
        .trim()
        .isNotEmpty) {
      status.value = Status.loading;
      OpenAIImageModel image = await OpenAI.instance.image.create(
        prompt: textC.text,
        n: 1,
        size: OpenAIImageSize.size512,
        responseFormat: OpenAIImageResponseFormat.url,
      );
      //store list og generated image uri
      url = image.data[0].url.toString();
      textC.text = '';
      status.value = Status.complete;
    } else {
      MyDialog.info('Provide some beautiful image description!');
    }
  }
    void downloadImage() async{
    try{
      //to show loading
      MyDialog.showLoadingDialog();

      log('url:$url');

      //download through http first
      final bytes =(await get(Uri.parse(url))).bodyBytes;
      final dir = await getTemporaryDirectory();
      final file = await File('${dir.path} /ai_image.png').writeAsBytes(bytes);

      
      log('filePath:${file.path}');
      //save image to gallery
      await GallerySaver.saveImage(file.path,albumName: appName).then((success) {

        //hide loading
        Get.back();
        MyDialog.success('Image Downloaded to Gallery!');
    });
  }on Exception catch(e){
      //hide loading
      Get.back();
      MyDialog.error('Something went wrong ( try again in sometime)!');
      log('downloadImageE:$e');
    }
    }
  void shareImage() async{
    try{
      //to show loading
      MyDialog.showLoadingDialog();

      log('url:$url');

      //download through http first
      final bytes =(await get(Uri.parse(url))).bodyBytes;
      final dir = await getTemporaryDirectory();
      final file = await File('${dir.path} /ai_image.png').writeAsBytes(bytes);


      log('filePath:${file.path}');
      //hide loading
        Get.back();
      final result = await Share.shareXFiles([XFile(file.path),],
      text:
      'Check out this Amazing Image created by Ai ChatBot app by Sewiii Mirza');
    }on Exception catch(e){
      //hide loading
      Get.back();
      MyDialog.error('Something went wrong ( try again in sometime)!');
      log('downloadImageE:$e');
    }
  }
}

