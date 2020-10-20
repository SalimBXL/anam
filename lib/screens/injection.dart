import 'package:anam/widgets/button_ok.dart';
import 'package:anam/widgets/card_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Injection extends StatefulWidget {
  Injection({Key key}) : super(key: key);

  @override
  _InjectionState createState() => _InjectionState();
}

class _InjectionState extends State<Injection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            CardBloc(content: traceur()),
            CardBloc(content: activity()),
            CardBloc(content: hour()),
            CardBloc(content: reste()),
            CardBloc(content: medication()),
          ],
        ),
        ButtonOk(action: () {}),
      ],
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
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Activité prévue : '),
            Text('Activité Réelle : '),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text('120.0 MBq'),
            Text('126.2 MBq'),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(' '),
            Text(' à 05:56'),
          ],
        )
      ],
    );
  }

  Row medication() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Glycémie : '),
            Text('Insuline : '),
            Text('Autre : '),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(''),
            Text('Qté : '),
            Text(' '),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text('88 mg/dl'),
            Text('  '),
            Text('  '),
          ],
        )
      ],
    );
  }

  Row reste() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Reste : '),
            Text('Dose appréciée : '),
            Text('Injection réalisée par : ')
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(' MBq'),
            Text('126.2 MBq'),
            Text(' '),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(' '),
            Text(' '),
            Text('[J.R.]'),
          ],
        )
      ],
    );
  }

  Column hour() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Heure injection prévue : '),
                Text('IV : '),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text('09:20'),
                Text('09:56'),
              ],
            ),
          ],
        ),
        Text('Localisation : B. Dr.'),
      ],
    );
  }

  Row traceur() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Icon(
              Icons.warning,
              color: Colors.pink,
              size: 30,
            ),
            Text(
              'FDG-F18',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
        Column(
          children: <Widget>[
            Text('SEVINDIK Evrim'),
            Text('[NPP 041220FD05]'),
          ],
        ),
      ],
    );
  }
}
