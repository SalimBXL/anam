import 'package:anam/classes/patient.dart';
import 'package:anam/main.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

const double iconSize = 48;
const Color iconColorMale = Colors.blue;
const Color iconColorFemale = Colors.pink;

class PatientListTile extends StatelessWidget {
  PatientListTile({@required this.patient});

  final Patient patient;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.person,
        size: iconSize,
        color: patient.isMale ? iconColorMale : iconColorFemale,
      ),
      title: Text(
        '[${patient.npp}] - ${patient.fullname}',
      ),
      subtitle: patientDataLine(patient),
      isThreeLine: true,
      onTap: () {},
      onLongPress: () => alertBox(context, patient).show(),
    );
  }
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
    children: <Widget>[
      Icon(Icons.golf_course),
      Text('${formatTime(patient.accueilTime)}'),
      Text(' - '),
      Icon(Icons.healing),
      Text('${formatTime(patient.injectionTime)}'),
      Text(' - '),
      Icon(Icons.settings_overscan),
      Text('${formatTime(patient.cameraTime)}'),
    ],
  );
}
