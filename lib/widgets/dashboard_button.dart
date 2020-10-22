import 'package:anam/widgets/card_bloc.dart';
import 'package:flutter/material.dart';

class DashboardButton extends StatelessWidget {
  DashboardButton({this.listLength, this.color, this.action, this.statusIcon});

  final int listLength;
  final Color color;
  final Function action;
  final IconData statusIcon;

  Widget build(BuildContext context) {
    return Column(
      children: [
        CardBloc(
          color: this.color,
          //onPressed: this.action,
          child: Icon(
            this.statusIcon,
            color: Colors.white,
            size: 40,
          ),
        ),
        Text(
          '${this.listLength}',
          style: TextStyle(),
        ),
      ],
    );
  }
}
