import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class PatientSheet extends StatefulWidget {
  PatientSheet({Key key}) : super(key: key);

  @override
  _PatientSheetState createState() => _PatientSheetState();
}

class _PatientSheetState extends State<PatientSheet> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          container(patientName()),
          container(anamnese()),
          container(injection()),
          container(scan()),
          container(misc()),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(8),
              child: FlatButton(
                padding: EdgeInsets.all(8),
                color: Colors.indigo,
                onPressed: () {
                  // Navigate back to first route when tapped.
                },
                child: Text(
                  'Ok',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Expanded container(Widget f) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.indigo.shade50,
        ),
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(8),
        child: f,
      ),
    );
  }

  Row scan() {
    return Row(
      children: <Widget>[
        Icon(
          Icons.settings_overscan,
          color: Colors.purple,
          size: 64,
        ),
        Text(' '),
        Text(
          'CAMERA',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ],
    );
  }

  Row injection() {
    return Row(
      children: <Widget>[
        Icon(
          Icons.warning,
          color: Colors.purple,
          size: 64,
        ),
        Text(' '),
        Text(
          'INJECTION',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ],
    );
  }

  Row misc() {
    return Row(
      children: <Widget>[
        Icon(
          Icons.info_outline,
          color: Colors.purple,
          size: 64,
        ),
        Text(' '),
        Text(
          'MISC',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ],
    );
  }

  Row anamnese() {
    return Row(
      children: <Widget>[
        Icon(
          Icons.question_answer,
          color: Colors.purple,
          size: 64,
        ),
        Text(' '),
        Text(
          'QUESTIONS',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ],
    );
  }

  Row patientName() {
    return Row(
      children: <Widget>[
        Icon(
          Icons.account_box,
          color: Colors.purple,
          size: 64,
        ),
        Text(' '),
        Text(
          'PATIENT FULLNAME',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
