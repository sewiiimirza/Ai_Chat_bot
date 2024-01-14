
import 'dart:convert';
import 'dart:developer';

import 'package:ai_chat_bot/apis/apis.dart';
import 'package:ai_chat_bot/controller/image_controller.dart';
import 'package:ai_chat_bot/helper/my_dialog.dart';
import 'package:ai_chat_bot/model/message.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class TranslatorController  extends GetxController{
  final textC= TextEditingController();
  final resultC=TextEditingController();

  final from=''.obs, to=''.obs;
  final status=Status.none.obs;

  
    // list of languages available
    final lang = const [
      "Afar",
      "Abkhazian",
      "Avestan",
      "Afrikaans",
      "Akan",
      "Amharic",
      "Aragonese",
      "Arabic",
      "Assamese",
      "Avaric",
      "Aymara",
      "Azerbaijani",
      "Bashkir",
      "Belarusian",
      "Bulgarian",
      "Bihari languages",
      "Bislama",
      "Bambara",
      "Bengali",
      "Tibetan",
      "Breton",
      "Bosnian",
      "Catalan",
      "Chechen",
      "Chamorro",
      "Corsican",
      "Cree",
      "Czech",
      "Church Slavic",
      "Chuvash",
      "Welsh",
      "Danish",
      "German",
      "Maldivian",
      "Dzongkha",
      "Ewe",
      "Greek",
      "English",
      "Esperanto",
      "Spanish",
      "Estonian",
      "Basque",
      "Persian",
      "Fulah",
      "Finnish",
      "Fijian",
      "Faroese",
      "French",
      "Western Frisian",
      "Irish",
      "Gaelic",
      "Galician",
      "Guarani",
      "Gujarati",
      "Manx",
      "Hausa",
      "Hebrew",
      "Hindi",
      "Hiri Motu",
      "Croatian",
      "Haitian",
      "Hungarian",
      "Armenian",
      "Herero",
      "Interlingua",
      "Indonesian",
      "Interlingue",
      "Igbo",
      "Sichuan Yi",
      "Inupiaq",
      "Ido",
      "Icelandic",
      "Italian",
      "Inuktitut",
      "Japanese",
      "Javanese",
      "Georgian",
      "Kongo",
      "Kikuyu",
      "Kuanyama",
      "Kazakh",
      "Kalaallisut",
      "Central Khmer",
      "Kannada",
      "Korean",
      "Kanuri",
      "Kashmiri",
      "Kurdish",
      "Komi",
      "Cornish",
      "Kirghiz",
      "Latin",
      "Luxembourgish",
      "Ganda",
      "Limburgan",
      "Lingala",
      "Lao",
      "Lithuanian",
      "Luba-Katanga",
      "Latvian",
      "Malagasy",
      "Marshallese",
      "Maori",
      "Macedonian",
      "Malayalam",
      "Mongolian",
      "Marathi",
      "Malay",
      "Maltese",
      "Burmese",
      "Nauru",
      "Norwegian",
      "North Ndebele",
      "Nepali",
      "Ndonga",
      "Dutch",
      "South Ndebele",
      "Navajo",
      "Chichewa",
      "Occitan",
      "Ojibwa",
      "Oromo",
      "Oriya",
      "Ossetic",
      "Panjabi",
      "Pali",
      "Polish",
      "Pushto",
      "Portuguese",
      "Quechua",
      "Romansh",
      "Rundi",
      "Romanian",
      "Russian",
      "Kinyarwanda",
      "Sanskrit",
      "Sardinian",
      "Sindhi",
      "Northern Sami",
      "Sango",
      "Sinhala",
      "Slovak",
      "Slovenian",
      "Samoan",
      "Shona",
      "Somali",
      "Albanian",
      "Serbian",
      "Swati",
      "Sotho, Southern",
      "Sundanese",
      "Swedish",
      "Swahili",
      "Tamil",
      "Telugu",
      "Tajik",
      "Thai",
      "Tigrinya",
      "Turkmen",
      "Tagalog",
      "Tswana",
      "Tonga",
      "Turkish",
      "Tsonga",
      "Tatar",
      "Twi",
      "Tahitian",
      "Uighur",
      "Ukrainian",
      "Urdu",
      "Uzbek",
      "Venda",
      "Vietnamese",
      "Volapük",
      "Walloon",
      "Wolof",
      "Xhosa",
      "Yiddish",
      "Yoruba",
      "Zhuang",
      "Chinese",
       "Zulu"
     ];



  Future<void> translate()async {
    if (textC.text
        .trim()
        .isNotEmpty && to.isNotEmpty) {
      status.value = Status.loading;
      String prompt = '';
      if (from.isNotEmpty) {
        prompt =
        'Can you translate give text from ${from.value}.to ${to.value}:\n${textC
            .text}';
      } else {
        prompt =
        'Can you translate give text from ${to.value}.to ${textC.text}';
      }
      log(prompt);
      final res = await APIs.getAnswer(prompt);
      resultC.text = utf8.decode(res.codeUnits);
      status.value = Status.complete;
    } else {
      status.value = Status.none;
      if (to.isEmpty) MyDialog.info('Select To Language');
      if (textC.text.isEmpty) MyDialog.info('Type something to Translate');
    }
  }
    void swapLanguage() {
      if (to.isNotEmpty && from.isNotEmpty) {
        final t = to.value;
        to.value = from.value;
        from.value = t;
      }
    }



}
