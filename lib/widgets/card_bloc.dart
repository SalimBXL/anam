import 'package:flutter/material.dart';

final Color backgroundColor = Colors.indigo[50];
const double externalSpace = 8;
const double internalSpace = 8;
const double roundBorderRadius = 15;

class CardBloc extends StatelessWidget {
  CardBloc({this.content});

  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(roundBorderRadius),
        color: backgroundColor,
      ),
      margin: EdgeInsets.all(externalSpace),
      padding: EdgeInsets.all(internalSpace),
      child: this.content,
    );
  }
}
