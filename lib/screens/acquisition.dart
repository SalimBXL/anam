import 'package:anam/classes/patient.dart';
import 'package:anam/widgets/button_ok.dart';
import 'package:anam/widgets/card_bloc.dart';
import 'package:anam/widgets/patient_name_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const double iconSize = 30;
const double bigTextSize = 20;

class Acquisition extends StatefulWidget {
  Acquisition({@required this.patient});

  final String pageName = 'acquisition';
  final Patient patient;

  @override
  _AcquisitionState createState() => _AcquisitionState();
}

class _AcquisitionState extends State<Acquisition> {
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
                  CardBloc(child: camera()),
                  CardBloc(child: acquisitionDetails()),
                  CardBloc(child: start()),
                  CardBloc(child: reste()),
                  CardBloc(child: nurse()),
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

  Row acquisitionDetails() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            FontAwesomeIcons.clock,
            size: iconSize,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Entrée prévue :'),
            Text('Durée (minutes) :'),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(' '),
            Text(' '),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text('10:15'),
            Text('15'),
          ],
        ),
      ],
    );
  }

  Row nurse() {
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
            Text('Acte réalisé par : '),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(' '),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text('JR'),
          ],
        ),
      ],
    );
  }

  Row reste() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            FontAwesomeIcons.braille,
            size: iconSize,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Coincidences (count/sec) :'),
            Text('Singles (10^6) :'),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(' '),
            Text(' '),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text('71746'),
            Text('5.19'),
          ],
        ),
      ],
    );
  }

  Row start() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            FontAwesomeIcons.playCircle,
            size: iconSize,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('PET démarré à :'),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(' '),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text('10:15'),
          ],
        ),
      ],
    );
  }

  Row camera() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                FontAwesomeIcons.radiationAlt,
                color: Colors.purple,
                size: 30,
              ),
            ),
            Text(
              'Acquisition'.toUpperCase(),
              textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: bigTextSize,
              ),
            ),
          ],
        ),
        Text(
          'VEREOS'.toUpperCase(),
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
