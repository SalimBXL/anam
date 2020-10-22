import 'package:anam/classes/patient.dart';
import 'package:anam/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
      contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 8),
      tileColor: patientStatusColor[patient.status].withOpacity(0.5),
      leading: Icon(
        Icons.person,
        size: iconSize,
        color: patient.isMale ? iconColorMale : iconColorFemale,
      ),
      title: Text(
        patient.fullname,
        style: TextStyle(
          fontSize: iconSize / 2.5,
          fontWeight: FontWeight.bold,
        ),
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
    desc: "[${patient.npp}]\n"
        "Wanted Time :  \n"
        "Injection Time : \n"
        "Camera Time :  \n",
  );
}

String formatTime(DateTime time) =>
    '${addZero(time.hour)}:${addZero(time.minute)}';

Row patientDataLine(Patient patient) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Row(
        children: [
          Icon(Icons.golf_course),
          textAccueilValue(patient),
        ],
      ),
      Text(' - '),
      Row(
        children: [
          Icon(FontAwesomeIcons.syringe),
          textInjectionValue(patient),
        ],
      ),
      Text(' - '),
      Row(
        children: [
          Icon(FontAwesomeIcons.radiationAlt),
          textAcquisitionValue(patient),
        ],
      ),
    ],
  );
}

Text textAccueilValue(Patient patient) {
  TextStyle style;
  String value;
  if (patient.injection.injectionReal == null ||
      patient.injection.injectionReal.toString().length < 3) {
    value = formatTime(patient.injection.injectionScheduled);
    style = TextStyle(fontStyle: FontStyle.italic);
  } else {
    value = formatTime(patient.injection.injectionReal);
    style = TextStyle(fontStyle: FontStyle.normal);
  }
  return Text(
    value,
    style: style,
  );
}

Text textInjectionValue(Patient patient) {
  TextStyle style;
  String value;
  if (patient.injection.injectionReal == null ||
      patient.injection.injectionReal.toString().length < 3) {
    value = formatTime(patient.injection.injectionScheduled);
    style = TextStyle(fontStyle: FontStyle.italic);
  } else {
    value = formatTime(patient.injection.injectionReal);
    style = TextStyle(fontStyle: FontStyle.normal);
  }
  return Text(
    value,
    style: style,
  );
}

Text textAcquisitionValue(Patient patient) {
  TextStyle style;
  String value;
  if (patient.acquisition.timeReal == null ||
      patient.acquisition.timeReal.toString().length < 3) {
    value = formatTime(patient.acquisition.timeScheduled);
    style = TextStyle(fontStyle: FontStyle.italic);
  } else {
    value = formatTime(patient.acquisition.timeReal);
    style = TextStyle(fontStyle: FontStyle.normal);
  }
  return Text(
    value,
    style: style,
  );
}
