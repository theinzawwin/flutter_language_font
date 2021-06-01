import 'package:flutter/material.dart';

import 'AppTranslation.dart';

class SecondView extends StatefulWidget {
  @override
  _SecondViewState createState() => _SecondViewState();
}

class _SecondViewState extends State<SecondView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    
    print('current ${AppTranslation.of(context).currentLanguage}');
    return Scaffold(
      appBar: AppBar(
        title: Text('Second View'),
      ),
      body: Container(
      child: Center(
        child: Text('ဘာသာစကားရွေးချယ်ပါ',style: TextStyle(fontFamily: 'Pyidaungsu')),
      ),
    ),
    );
    
     
  }
}