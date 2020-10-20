import 'package:anam/classes/patient.dart';
import 'package:flutter/material.dart';

class DashboardButton extends StatelessWidget {
  DashboardButton({this.listLength, this.color, this.action, this.status});

  final int listLength;
  final Color color;
  final Function action;
  final PatientStatus status;

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: FloatingActionButton(
            onPressed: this.action,
            child: patientStatusIcon[this.status],
            backgroundColor: this.color,
            foregroundColor: Colors.white,
          ),
        ),
        Text(
          '${this.listLength}',
          style: TextStyle(),
        ),
      ],
    );
  }
}
