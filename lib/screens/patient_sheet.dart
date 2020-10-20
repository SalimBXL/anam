import 'package:anam/widgets/button_ok.dart';
import 'package:anam/widgets/card_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const double iconSize = 48;
const Color iconColor = Colors.purple;
const double fontSize = 20;

class PatientSheet extends StatefulWidget {
  PatientSheet({Key key}) : super(key: key);

  @override
  _PatientSheetState createState() => _PatientSheetState();
}

class _PatientSheetState extends State<PatientSheet> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            CardBloc(
                content:
                    cardContent(icon: Icons.account_box, text: 'Patient data')),
            CardBloc(
                content: cardContent(
                    icon: FontAwesomeIcons.fileMedical, text: 'questions')),
            CardBloc(
                content: cardContent(
                    icon: FontAwesomeIcons.syringe, text: 'injection')),
            CardBloc(
                content: cardContent(
                    icon: FontAwesomeIcons.radiationAlt, text: 'aquisition')),
            CardBloc(content: cardContent(icon: Icons.info, text: 'misc')),
          ],
        ),
        ButtonOk(action: () {}),
      ],
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
