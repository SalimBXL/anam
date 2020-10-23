import 'package:anam/classes/patient.dart';
import 'package:anam/screens/acquisition.dart';
import 'package:anam/screens/dashboard.dart';
import 'package:anam/screens/patient_details.dart';
import 'package:anam/widgets/button_ok.dart';
import 'package:anam/widgets/card_bloc.dart';
import 'package:anam/widgets/patient_name_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'injection.dart';

const double iconSize = 48;
const Color iconColor = Colors.purple;
const double fontSize = 16;

class PatientSheet extends StatelessWidget {
  PatientSheet({@required this.patient});

  final Patient patient;
  final String pageName = 'patientSheet';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  CardBloc(
                    child: PatientNameBloc(
                      nomPatient: patient.fullname,
                      nppPatient: patient.npp,
                      statusPatientIcon: patientStatusIcon[patient.status],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              PatientDetails(patient: patient),
                        ),
                      );
                    },
                    child: CardBloc(
                        child: cardContent(
                            icon: Icons.account_box, text: 'Données patient')),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              PatientDetails(patient: patient),
                        ),
                      );
                    },
                    child: CardBloc(
                        child: cardContent(
                            icon: FontAwesomeIcons.fileMedical,
                            text: 'questions')),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Injection(patient: patient),
                        ),
                      );
                    },
                    child: CardBloc(
                        child: cardContent(
                            icon: FontAwesomeIcons.syringe, text: 'injection')),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Acquisition(patient: patient),
                        ),
                      );
                    },
                    child: CardBloc(
                        child: cardContent(
                            icon: FontAwesomeIcons.radiationAlt,
                            text: 'aquisition')),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: CardBloc(
                      child: cardContent(icon: Icons.info, text: 'misc'),
                    ),
                  ),
                ],
              ),
              ButtonOk(action: () {
                Navigator.pop(context);
              }),
            ],
          ),
        ),
      ),
    );
  }

  Row cardContent({@required IconData icon, @required String text}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Icon(
          icon,
          color: iconColor,
          size: iconSize,
        ),
        Text(' '),
        Text(
          text.toUpperCase(),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: fontSize,
          ),
        ),
      ],
    );
  }
}
