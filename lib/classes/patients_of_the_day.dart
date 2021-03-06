import 'package:anam/classes/patient.dart';

class PatientsOfTheDay {
  PatientStatus _statusToShow = PatientStatus.all;

  List<Patient> _patients = [
    Patient("770324MJ03", "JOLY Joly", PatientStatus.todo,
        poidKg: 90, tailleCm: 183),
    Patient("041220FD05", "SEVINDIK Evrim", PatientStatus.active,
        poidKg: 74, tailleCm: 168),
  ];

  PatientStatus get statusToShow => this._statusToShow;

  int get numberOfpatient => this._patients.length;

  List<Patient> getPatientsWithStatus(PatientStatus patientStatus) {
    return patientStatus != PatientStatus.all
        ? this._patients.where((i) => i.status == patientStatus).toList()
        : this._patients;
  }

  set statusToShow(PatientStatus newStatus) => this._statusToShow = newStatus;
}
