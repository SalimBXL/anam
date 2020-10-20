import 'package:flutter/material.dart';

const double padding = 8;

class ButtonOk extends StatelessWidget {
  ButtonOk({@required this.action});

  final Function action;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(padding),
        child: RaisedButton(
          onPressed: this.action,
          child: Text('Ok'),
        ));
  }
}
