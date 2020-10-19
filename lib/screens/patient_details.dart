import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class PatientDetails extends StatefulWidget {
  PatientDetails({Key key}) : super(key: key);

  @override
  _PatientDetailsState createState() => _PatientDetailsState();
}

class _PatientDetailsState extends State<PatientDetails> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          container(patientName()),
          container(ambu()),
          container(patientMisc()),
          container(annotation()),
          buttonOk(),
        ],
      ),
    );
  }

  Expanded buttonOk() {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(8),
        child: FlatButton(
          padding: EdgeInsets.all(8),
          color: Colors.indigo,
          onPressed: () {
            // Navigate back to first route when tapped.
          },
          child: Text(
            'Ok',
            style: TextStyle(color: Colors.white),
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

  Text annotation() {
    return Text(
      'Annotation : hufheuhfjkhdjvhrukqhkhwjfhdwhd, bnnjfdqkhkjn jrqhc gheqkghrc, gq, iljk, hj khfjnhbjn jkbwfdjkbk',
      overflow: TextOverflow.ellipsis,
      softWrap: true,
      maxLines: 3,
    );
  }

  Row patientName() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Icon(
          Icons.account_box,
          color: Colors.pink,
          size: 70,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  'SEVINDIK Evrim',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            Text('[NPP 041220FD05]'),
          ],
        )
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
            Text('Age : 16 ans'),
            Text('Statut : '),
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

  Column patientMisc() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text('Poids : 98Kg'),
            Text('Taille : 1,65m'),
            Text('BMI : 36'),
          ],
        ),
      ],
    );
  }
}
