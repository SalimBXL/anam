import 'package:anam/main.dart';
import 'package:anam/screens/patient_sheet.dart';
import 'package:flutter/material.dart';
import 'package:anam/classes/patient.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

ListTile patientListTile(BuildContext context, Patient patient) {
  return ListTile(
    leading: Icon(
      Icons.person,
      size: 48,
      color: patient.isMale ? Colors.blue : Colors.pink,
    ),
    title: patientNameLine(patient),
    subtitle: patientDataLine(patient),
    isThreeLine: true,
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PatientSheet()),
      );
    },
    onLongPress: () => alertBox(context, patient).show(),
  );
}

Alert alertBox(BuildContext context, Patient patient) {
  return Alert(
    context: context,
    title: "${patient.fullname}",
    desc: "[${patient.npp}]\n\n"
        "Wanted Time : ${formatTime(patient.accueilTime)} \n"
        "Injection Time : ${formatTime(patient.injectionTime)} \n"
        "Camera Time : ${formatTime(patient.cameraTime)} \n",
  );
}

String formatTime(DateTime time) =>
    '${addZero(time.hour)}:${addZero(time.minute)}';

Row patientDataLine(Patient patient) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    mainAxisSize: MainAxisSize.max,
    children: <Widget>[
      Icon(Icons.golf_course),
      Text('${formatTime(patient.accueilTime)}'),
      Text(' - '),
      Icon(Icons.healing),
      Text('${formatTime(patient.injectionTime)}'),
      Text(' - '),
      Icon(Icons.check_box_outline_blank),
      Text('${formatTime(patient.cameraTime)}'),
    ],
  );
}

Row patientNameLine(Patient patient) {
  return Row(
    children: <Widget>[
      Text(
        '[${patient.npp}]',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      Text(' - '),
      Text(
        '${patient.fullname}',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    ],
  );
}
