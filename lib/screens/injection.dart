import 'package:anam/classes/patient.dart';
import 'package:anam/widgets/button_ok.dart';
import 'package:anam/widgets/card_bloc.dart';
import 'package:anam/widgets/patient_name_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const double iconSize = 30;
const double bigTextSize = 20;

class Injection extends StatefulWidget {
  Injection({@required this.patient});

  final String pageName = 'injection';
  final Patient patient;

  @override
  _InjectionState createState() => _InjectionState();
}

class _InjectionState extends State<Injection> {
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
                  CardBloc(child: traceur()),
                  CardBloc(child: activity()),
                  CardBloc(child: hour()),
                  CardBloc(child: misc()),
                  CardBloc(child: reste()),
                  CardBloc(child: medication()),
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

  Expanded container(Widget f) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.indigo.shade50,
        ),
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(8),
        child: f,
      ),
    );
  }

  Row activity() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            FontAwesomeIcons.radiation,
            size: iconSize,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Activité prévue :'),
            Text('Activité Réelle :'),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text('${patient.injection.activityScheduled} MBq'),
            Text('${patient.injection.activityReal} MBq'),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(''),
            Text('à '),
          ],
        ),
      ],
    );
  }

  Row medication() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            FontAwesomeIcons.fileMedicalAlt,
            size: iconSize,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Glycémie : '),
            Text('Insuline : '),
            Text('Autre : '),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(''),
            Text('Qté : '),
            Text(' '),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text('${patient.injection.glycemie} mg/dl'),
            Text(''),
            Text('${patient.injection.autre}'),
          ],
        ),
      ],
    );
  }

  Row reste() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            FontAwesomeIcons.windowRestore,
            size: iconSize,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Reste : '),
            Text('Dose appréciée : '),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(' '),
            Text(' '),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text('${patient.injection.activityReste} MBq'),
            Text('${patient.injection.activityAppreciated} MBq'),
          ],
        ),
      ],
    );
  }

  Row misc() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            FontAwesomeIcons.userMd,
            size: iconSize,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Localisation : '),
            Text('Acte réalisé par : '),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(' '),
            Text(' '),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text('${patient.injection.injectLocalisationDescription}'),
            Text('${patient.injection.nurseID}'),
          ],
        ),
      ],
    );
  }

  Row hour() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            FontAwesomeIcons.clock,
            size: iconSize,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Prévue :'),
            Text('IV : '),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(' '),
            Text(' '),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text('${patient.injection.injectionTimeScheduled}'),
            Text('${patient.injection.injectionTimeReal}'),
          ],
        ),
      ],
    );
  }

  Row traceur() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                FontAwesomeIcons.syringe,
                color: Colors.purple,
                size: 30,
              ),
            ),
            Text(
              'Injection'.toUpperCase(),
              textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: bigTextSize,
              ),
            ),
          ],
        ),
        Text(
          'FDG-F18'.toUpperCase(),
          textAlign: TextAlign.left,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: bigTextSize,
          ),
        ),
      ],
    );
  }
}
