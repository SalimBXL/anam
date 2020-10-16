import 'package:anam/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:anam/classes/patient.dart';
import 'package:anam/widgets/patient_list_tile.dart';

// patientStatusColor[patientsList[index].status].withAlpha(50)

ListView patientsList(BuildContext context, PatientStatus status) {
  List<Patient> patientsList = patients.getPatientsWithStatus(status);

  return ListView.builder(
    padding: const EdgeInsets.all(5),
    itemCount: patientsList.length,
    itemBuilder: (BuildContext context, int index) {
      return patientListTile(context, patientsList[index]);
    },
  );
}
