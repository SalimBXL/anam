import 'package:anam/screens/acquisition.dart';
import 'package:anam/screens/dashboard.dart';
import 'package:anam/screens/injection.dart';
import 'package:anam/screens/patient_details.dart';
import 'package:anam/screens/patient_sheet.dart';
import 'package:anam/widgets/theme.dart';
import 'package:flutter/material.dart';

void main() => runApp(Anam());

String addZero(int number) => number < 10 ? '0$number' : '$number';

class Anam extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme(),
      initialRoute: '/dashboard',
      routes: {
        '/${Dashboard().pageName}': (context) => Dashboard(),
        '/${PatientSheet().pageName}': (context) => PatientSheet(),
        '/${PatientDetails().pageName}': (context) => PatientDetails(),
        '/${Injection().pageName}': (context) => Injection(),
        '/${Acquisition().pageName}': (context) => Acquisition(),
      },
    );
  }
}
