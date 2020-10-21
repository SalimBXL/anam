import 'package:anam/widgets/button_ok.dart';
import 'package:anam/widgets/card_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Acquisition extends StatefulWidget {
  Acquisition({Key key}) : super(key: key);

  @override
  _AcquisitionState createState() => _AcquisitionState();
}

class _AcquisitionState extends State<Acquisition> {
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CardBloc(
                  content: Icon(
                    FontAwesomeIcons.radiationAlt,
                    color: Colors.pink,
                    size: 30,
                  ),
                ),
                CardBloc(content: camera()),
                Expanded(child: CardBloc(content: patient())),
              ],
            ),
            CardBloc(content: acquisitionDetails()),
            CardBloc(content: start()),
            CardBloc(content: reste()),
            CardBloc(content: nurse()),
            CardBloc(
              content: Text(
                'NOTE : bgyhzgejhfgejh gyezgj hgezy'
                ' ejz yuzgf jhzg  yzgefj juejyfgzejy'
                'fygjyfgjhg FG FGJ',
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
              ),
            ),
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

  Row acquisitionDetails() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Entrée prévue : '),
            Text('Durée prévue : '),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text('10:05'),
            Text('15'),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(' '),
            Text('minute(s)'),
          ],
        )
      ],
    );
  }

  Row nurse() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Acquisition lancée par : '),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(''),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text('K.L'),
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
            Text('Coincidence : '),
            Text('Singles : '),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text('71746'),
            Text('5.19'),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text('count/sec'),
            Text('(10^6)'),
          ],
        )
      ],
    );
  }

  Row start() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'PET démarré à :',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(
              '10:20',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(' '),
          ],
        )
      ],
    );
  }

  Text camera() {
    return Text(
      'VEREOS',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    );
  }

  Column patient() {
    return Column(
      children: <Widget>[
        Text(
          'SEVINDIK Evrim',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text('[NPP 041220FD05]'),
      ],
    );
  }
}
