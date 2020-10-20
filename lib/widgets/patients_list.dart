import 'package:anam/classes/patient.dart';
import 'package:anam/screens/dashboard.dart';
import 'package:anam/widgets/patient_list_tile.dart';
import 'package:flutter/material.dart';

const double padding = 5;

class PatientList extends StatelessWidget {
  PatientList({@required this.status});

  final PatientStatus status;

  @override
  Widget build(BuildContext context) {
    List<Patient> _patientsList = patients.getPatientsWithStatus(this.status);
    return ListView.builder(
      padding: const EdgeInsets.all(padding),
      itemCount: _patientsList.length,
      itemBuilder: (BuildContext context, int index) =>
          PatientListTile(patient: _patientsList[index]),
    );
  }
}
