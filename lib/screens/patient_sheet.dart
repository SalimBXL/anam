import 'package:anam/widgets/button_ok.dart';
import 'package:anam/widgets/card_bloc.dart';
import 'package:anam/widgets/patient_name_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const double iconSize = 48;
const Color iconColor = Colors.purple;
const double fontSize = 20;

class PatientSheet extends StatefulWidget {
  PatientSheet({Key key}) : super(key: key);

  final String pageName = 'patientSheet';

  @override
  _PatientSheetState createState() => _PatientSheetState();
}

class _PatientSheetState extends State<PatientSheet> {
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
                      nomPatient: 'SEVINDIK Evrim',
                      nppPatient: '[041220FD05]',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: CardBloc(
                        child: cardContent(
                            icon: Icons.account_box, text: 'Patient data')),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: CardBloc(
                        child: cardContent(
                            icon: FontAwesomeIcons.fileMedical,
                            text: 'questions')),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: CardBloc(
                        child: cardContent(
                            icon: FontAwesomeIcons.syringe, text: 'injection')),
                  ),
                  GestureDetector(
                    onTap: () {},
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
