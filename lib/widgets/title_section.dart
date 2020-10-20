import 'package:flutter/material.dart';

class TitleSection extends StatelessWidget {
  TitleSection({@required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(this.title);
  }
}
