import 'package:anam/classes/patient.dart';
import 'package:anam/screens/dashboard.dart';
import 'package:flutter/material.dart';

const double iconSize = 54;
const double text1Size = 20;

class PatientNameBloc extends StatelessWidget {
  PatientNameBloc(
      {@required this.nomPatient, this.nppPatient, this.statusPatientIcon});

  final String nomPatient;
  final String nppPatient;
  final IconData statusPatientIcon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.account_box,
              color: Colors.pink,
              size: iconSize,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      this.nomPatient,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: text1Size,
                      ),
                    ),
                  ],
                ),
                Text('[${this.nppPatient}]'),
              ],
            ),
          ],
        ),
        Icon(this.statusPatientIcon),
      ],
    );
  }
}
