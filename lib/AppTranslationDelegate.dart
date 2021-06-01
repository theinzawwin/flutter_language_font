import 'package:flutter/material.dart';
import 'package:language_app_tzw/AppTranslation.dart';

import 'Application.dart';

class AppTranslationDelegate extends LocalizationsDelegate<AppTranslation>{
  final Locale newLocale;

  const AppTranslationDelegate({this.newLocale});

  @override
  bool isSupported(Locale locale) {
      // TODO: implement isSupported
     // return ["en","es"].contains(locale.languageCode);
     return application.supportedLanguagesCodes.contains(locale.languageCode);
    }
  
    @override
    Future<AppTranslation> load(Locale locale) {
      // TODO: implement load
      return AppTranslation.load(newLocale ?? locale);
    }
  
    @override
    bool shouldReload(covariant LocalizationsDelegate<AppTranslation> old) {
    // TODO: implement shouldReload
    return true;
  }
  
}