import 'package:anam/classes/patients_of_the_day.dart';
import 'package:anam/widgets/patients_list.dart';
import 'package:flutter/material.dart';
import 'package:anam/classes/patient.dart';
import 'package:anam/widgets/dashboard_button.dart';

PatientsOfTheDay patients = PatientsOfTheDay();

class Dashboard extends StatefulWidget {
  Dashboard({Key key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
                    patients.getPatientsWithStatus(PatientStatus.done).length),
                color: patientStatusColor[PatientStatus.all],
                action: () {
                  setState(() {
                    patients.statusToShow = PatientStatus.all;
                  });
                },
                status: PatientStatus.all,
              ),
              DashboardButton(
                listLength:
                    patients.getPatientsWithStatus(PatientStatus.todo).length,
                color: patientStatusColor[PatientStatus.todo],
                action: () {
                  setState(() {
                    patients.statusToShow = PatientStatus.todo;
                  });
                },
                status: PatientStatus.todo,
              ),
              DashboardButton(
                listLength:
                    patients.getPatientsWithStatus(PatientStatus.active).length,
                color: patientStatusColor[PatientStatus.active],
                action: () {
                  setState(() {
                    patients.statusToShow = PatientStatus.active;
                  });
                },
                status: PatientStatus.active,
              ),
              DashboardButton(
                // PATIENTS DONE
                listLength:
                    patients.getPatientsWithStatus(PatientStatus.done).length,
                color: patientStatusColor[PatientStatus.done],
                action: () {
                  setState(() {
                    patients.statusToShow = PatientStatus.done;
                  });
                },
                status: PatientStatus.done,
              ),
            ],
          ),
        ),
        Expanded(child: PatientList(status: patients.statusToShow)),
      ],
    );
  }
}
