import 'package:flutter/material.dart';

const double iconSize = 54;
const double text1Size = 20;

class PatientNameBloc extends StatelessWidget {
  PatientNameBloc({this.nomPatient, this.nppPatient});

  final String nomPatient;
  final String nppPatient;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
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
            Text(this.nppPatient),
          ],
        )
      ],
    );
  }
}
