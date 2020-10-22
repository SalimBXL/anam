import 'package:anam/screens/acquisition.dart';
import 'package:anam/screens/dashboard.dart';
import 'package:anam/screens/injection.dart';
import 'package:anam/screens/patient_details.dart';
import 'package:anam/screens/patient_sheet.dart';
import 'package:anam/widgets/title_section.dart';
import 'package:flutter/material.dart';

void main() => runApp(Anam());

String addZero(int number) => number < 10 ? '0$number' : '$number';

class Anam extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green,
        scaffoldBackgroundColor: Colors.amber.shade50,
        accentColor: Colors.amber,
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.green,
          textTheme: ButtonTextTheme.primary,
        ),
        textTheme: TextTheme(
          bodyText1: TextStyle(
            color: Colors.green,
          ),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.view_list),
          title: TitleSection(title: 'Titre'),
          elevation: 0.0,
          actions: <Widget>[
            Icon(Icons.list_alt),
            Icon(Icons.notifications_none),
            Icon(Icons.notifications_off),
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(0),
            child: Dashboard(),
            //child: PatientSheet(),
            //child: PatientDetails(),
            //child: Injection(),
            //child: Acquisition(),
          ),
        ),
      ),
    );
  }
}
