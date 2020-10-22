import 'package:flutter/material.dart';

final Color backgroundColor = Colors.indigo[50];
const double externalSpace = 8;
const double internalSpace = 8;
const double roundBorderRadius = 15;

class CardBloc extends StatelessWidget {
  CardBloc({this.child, this.color});

  final Widget child;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(roundBorderRadius),
        color: this.color == null ? backgroundColor : this.color,
      ),
      margin: EdgeInsets.symmetric(
          horizontal: externalSpace, vertical: externalSpace / 2),
      padding: EdgeInsets.all(internalSpace),
      child: this.child,
    );
  }
}
