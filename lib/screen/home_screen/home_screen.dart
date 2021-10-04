import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:localization/generated/l10n.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  String selectedLanguage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text('${S.of(context).Localization}'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: DropdownButton(
          focusColor: Colors.white,
          value: selectedLanguage,
          elevation: 5,
          style: TextStyle(color: Colors.white),
          iconEnabledColor: Colors.black,
          items: [S.of(context).english, S.of(context).portuguese]
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: TextStyle(color: Colors.black),
              ),
            );
          }).toList(),
          hint: Text(
            S.of(context).changeLanguage,
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          onChanged: (String value) {
            setState(() {
              print('Value --> $value');
              changeLanguage(value);
            });
          },
        ),
      ),
    );
  }

  void changeLanguage(String localization) {
    switch (localization) {
      case 'English':
        S.load(Locale.fromSubtags(countryCode: 'US', languageCode: 'en'));
        break;
      case 'Portuguese':
        S.load(Locale.fromSubtags(countryCode: 'BR', languageCode: 'pt'));
        break;
      default:
        S.load(Locale.fromSubtags(countryCode: 'US', languageCode: 'en'));
        break;
    }
  }
}
