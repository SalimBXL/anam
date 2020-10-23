import 'package:anam/classes/patient.dart';
import 'package:anam/widgets/button_ok.dart';
import 'package:anam/widgets/card_bloc.dart';
import 'package:anam/widgets/patient_name_bloc.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const double iconSize = 30;
const double bigTextSize = 16;

class PatientDetails extends StatefulWidget {
  PatientDetails({@required this.patient});

  final String pageName = 'patientDetails';
  final Patient patient;

  @override
  _PatientDetailsState createState() => _PatientDetailsState();
}

class _PatientDetailsState extends State<PatientDetails> {
  Patient patient;

  @override
  void initState() {
    super.initState();
    updateUI(widget.patient);
  }

  void updateUI(Patient p) {
    patient = p;
  }

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
                    nomPatient: patient.fullname,
                    nppPatient: patient.npp,
                  )),
                  CardBloc(child: patientInfo()),
                  CardBloc(child: ambu()),
                  CardBloc(child: patientMisc()),
                  CardBloc(child: poidTaille()),
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

  Row patientInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.account_box,
                color: Colors.purple,
                size: iconSize,
              ),
            ),
            Text(
              'Données patient'.toUpperCase(),
              textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: bigTextSize,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Row annotation() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(FontAwesomeIcons.notesMedical),
        ),
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

  Row ambu() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(FontAwesomeIcons.male),
            ),
            Text(' Age : ${patient.age} ans'),
          ],
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(FontAwesomeIcons.infoCircle),
            ),
            Text(' Statut : '),
          ],
        ),
      ],
    );
  }

  Row patientMisc() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        FlatButton(
          onPressed: () {
            setState(() {
              if (!patient.isAmbulatoire) patient.ambulatoire = AmbuHospi.ambu;
            });
          },
          color: patient.isAmbulatoire ? Theme.of(context).primaryColor : null,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(FontAwesomeIcons.walking),
              ),
              Text('Ambu'),
            ],
          ),
        ),
        FlatButton(
          onPressed: () {
            setState(() {
              if (patient.isAmbulatoire) patient.ambulatoire = AmbuHospi.hospi;
            });
          },
          color: patient.isAmbulatoire ? null : Theme.of(context).primaryColor,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(FontAwesomeIcons.hospitalUser),
              ),
              Text('Hospi'),
            ],
          ),
        ),
      ],
    );
  }

  Row poidTaille() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(FontAwesomeIcons.weightHanging),
            ),
            Text('${patient.poidKg}Kg'),
          ],
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(FontAwesomeIcons.textHeight),
            ),
            Text('${patient.tailleMetre}m'),
          ],
        ),
        Row(
          children: [
            Text(
              'BMI : ',
              style:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: bigTextSize),
            ),
            Text('${patient.bmi}'),
          ],
        ),
      ],
    );
  }
}
