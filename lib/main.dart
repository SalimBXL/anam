import 'package:anam/screens/injection.dart';
import 'package:anam/widgets/section_title.dart';
import 'package:flutter/material.dart';

void main() => runApp(Anam());

String addZero(int number) => number < 10 ? '0$number' : '$number';

class Anam extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: sectionTitle(),
          elevation: 0.0,
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(0),
            //child: Dashboard(),
            //child: PatientDetails(),
            //child: PatientSheet(),
            child: Injection(),
          ),
        ),
      ),
    );
  }
}