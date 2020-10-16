import 'package:anam/classes/patient.dart';

class PatientsOfTheDay {
  PatientStatus _statusToShow = PatientStatus.all;

  List<Patient> _patients = [
    Patient("770324MJ03", "Salim A. JOLY", PatientStatus.todo),
    Patient("770324FJ03", "Salim A. JOLY", PatientStatus.todo),
    Patient("770324FJ03", "Salim A. JOLY", PatientStatus.todo),
    Patient("770324FJ03", "Salim A. JOLY", PatientStatus.todo),
    Patient("770324MJ03", "Salim A. JOLY", PatientStatus.todo),
    Patient("770324MJ03", "Salim A. JOLY", PatientStatus.todo),
    Patient("770324MJ03", "Salim A. JOLY", PatientStatus.todo),
    Patient("770324MJ03", "Salim A. JOLY", PatientStatus.active),
    Patient("770324FJ03", "Salim A. JOLY", PatientStatus.active),
    Patient("770324MJ03", "Salim A. JOLY", PatientStatus.done),
    Patient("770324MJ03", "Salim A. JOLY", PatientStatus.done),
    Patient("770324FJ03", "Salim A. JOLY", PatientStatus.done),
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
