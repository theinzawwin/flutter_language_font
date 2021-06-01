import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTranslation {
  Locale locale;
  static Map<dynamic,dynamic> _localizedValues;
  AppTranslation(Locale locale){
    this.locale=locale;
  }

  static AppTranslation of(BuildContext context){
    return Localizations.of(context, AppTranslation);
  }

  static Future<AppTranslation> load(Locale locale) async{
    AppTranslation appTranslation= AppTranslation(locale);
    String jsonContent=await rootBundle.loadString("assets/locale/localization_${locale.languageCode}.json");
    _localizedValues=json.decode(jsonContent);
    return appTranslation;
  }

  get currentLanguage=>locale.languageCode;

  String text(String key){
    return _localizedValues[key]??"$key not found";
  }


}