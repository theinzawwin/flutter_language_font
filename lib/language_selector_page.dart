import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'AppTranslation.dart';
import 'Application.dart';

class LanguageSelectorPage extends StatefulWidget {
  @override
  _LanguageSelectorPageState createState() => _LanguageSelectorPageState();
}

class _LanguageSelectorPageState extends State<LanguageSelectorPage> {
  
  static final List<String> languageList= application.supportedLanguages;
  static final List<String> languageCodesList= application.supportedLanguagesCodes;

  final Map<dynamic, dynamic> languagesMap= {
    languageList[0]: languageCodesList[0],
    languageList[1]: languageCodesList[1],
    languageList[2]: languageCodesList[2],
  };
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: Text(
         AppTranslation.of(context).text("title_select_language"),
        ),
      ),
      body: _buildLanguagesList(),
    );
  }
  _buildLanguagesList() {
    return ListView.builder(
      itemCount: languageList.length,
      itemBuilder: (context, index) {
        return _buildLanguageItem(languageList[index]);
      },
    );
  }

  _buildLanguageItem(String language) {
    return InkWell(
      onTap: () async{
        print(language);
        application.onLocaleChanged(Locale(languagesMap[language]));
        saveLanguage(languagesMap[language]);
      },
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Text(
            language,
            style: TextStyle(
              fontSize: 24.0,
            ),
          ),
        ),
      ),
    );
  }
  saveLanguage(String lanCode) async{
     var prefs = await SharedPreferences.getInstance();
    await prefs.setString('language_code', lanCode);
    //await prefs.setString('country_code', '');
  }
}