import 'package:anam/widgets/button_ok.dart';
import 'package:anam/widgets/card_bloc.dart';
import 'package:anam/widgets/patient_name_bloc.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PatientDetails extends StatefulWidget {
  PatientDetails({Key key}) : super(key: key);

  final String pageName = 'patientDetails';

  @override
  _PatientDetailsState createState() => _PatientDetailsState();
}

class _PatientDetailsState extends State<PatientDetails> {
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
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  CardBloc(
                      child: PatientNameBloc(
                    nomPatient: 'SEVINDIK Evrim',
                    nppPatient: '041220FD05',
                  )),
                  CardBloc(child: ambu()),
                  CardBloc(child: patientMisc()),
                  CardBloc(child: annotation()),
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

  Row annotation() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(FontAwesomeIcons.notesMedical),
        Expanded(
          child: Text(
            'hufheuhfjkhdjvhrukqhkhwjfhdwhd, bnnjfdqkhkjn jrqhc gheqkghrc, gq, iljk, hj khfjnhbjn jkbwfdjkbk',
            overflow: TextOverflow.ellipsis,
            softWrap: true,
            maxLines: 3,
          ),
        ),
      ],
    );
  }

  Column ambu() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              children: [
                Icon(FontAwesomeIcons.male),
                Text(' Age : 16 ans'),
              ],
            ),
            Row(
              children: [
                Icon(FontAwesomeIcons.infoCircle),
                Text(' Statut : '),
              ],
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Ambu'),
            Text('Hospi'),
          ],
        ),
      ],
    );
  }

  Row patientMisc() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: [
            Icon(FontAwesomeIcons.weightHanging),
            Text(' Poids : 98Kg'),
          ],
        ),
        Row(
          children: [
            Icon(FontAwesomeIcons.textHeight),
            Text(' Taille : 1,65m'),
          ],
        ),
        Row(
          children: [
            Text('BMI : 36'),
          ],
        ),
      ],
    );
  }
}
