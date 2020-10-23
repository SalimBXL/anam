import 'package:anam/classes/patients_of_the_day.dart';
import 'package:anam/widgets/patients_list.dart';
import 'package:flutter/material.dart';
import 'package:anam/classes/patient.dart';
import 'package:anam/widgets/dashboard_button.dart';

PatientsOfTheDay patients = PatientsOfTheDay();

Map<PatientStatus, Color> patientStatusColor = {
  PatientStatus.all: Colors.blue,
  PatientStatus.todo: Colors.amber,
  PatientStatus.active: Colors.green,
  PatientStatus.done: Colors.red
};

Map<PatientStatus, IconData> patientStatusIcon = {
  PatientStatus.all: Icons.people,
  PatientStatus.todo: Icons.hourglass_full,
  PatientStatus.active: Icons.healing,
  PatientStatus.done: Icons.done,
};

class Dashboard extends StatefulWidget {
  Dashboard({Key key}) : super(key: key);

  final String pageName = 'dashboard';

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(0),
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.indigo.shade50,
                ),
                margin: EdgeInsets.all(8),
                padding: EdgeInsets.all(8),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    DashboardButton(
                      listLength: (patients
                              .getPatientsWithStatus(PatientStatus.todo)
                              .length +
                          patients
                              .getPatientsWithStatus(PatientStatus.active)
                              .length +
                          patients
                              .getPatientsWithStatus(PatientStatus.done)
                              .length),
                      color: patientStatusColor[PatientStatus.all],
                      action: () {
                        setState(() {
                          patients.statusToShow = PatientStatus.all;
                        });
                      },
                      statusIcon: patientStatusIcon[PatientStatus.all],
                    ),
                    DashboardButton(
                      listLength: patients
                          .getPatientsWithStatus(PatientStatus.todo)
                          .length,
                      color: patientStatusColor[PatientStatus.todo],
                      action: () {
                        setState(() {
                          patients.statusToShow = PatientStatus.todo;
                        });
                      },
                      statusIcon: patientStatusIcon[PatientStatus.todo],
                    ),
                    DashboardButton(
                      listLength: patients
                          .getPatientsWithStatus(PatientStatus.active)
                          .length,
                      color: patientStatusColor[PatientStatus.active],
                      action: () {
                        setState(() {
                          patients.statusToShow = PatientStatus.active;
                        });
                      },
                      statusIcon: patientStatusIcon[PatientStatus.active],
                    ),
                    DashboardButton(
                      // PATIENTS DONE
                      listLength: patients
                          .getPatientsWithStatus(PatientStatus.done)
                          .length,
                      color: patientStatusColor[PatientStatus.done],
                      action: () {
                        setState(() {
                          patients.statusToShow = PatientStatus.done;
                        });
                      },
                      statusIcon: patientStatusIcon[PatientStatus.done],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: PatientList(
                  status: patients.statusToShow,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
