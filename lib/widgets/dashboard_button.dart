import 'package:anam/classes/patient.dart';
import 'package:flutter/material.dart';

Column dashboardButton(
    {int listLength, Color color, Function action, PatientStatus status}) {
  return Column(
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          onPressed: action,
          child: patientStatusIcon[status],
          backgroundColor: color,
          foregroundColor: Colors.white,
        ),
      ),
      Text(
        '$listLength',
        style: TextStyle(),
      ),
    ],
  );
}
