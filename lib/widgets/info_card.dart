import 'package:flutter/material.dart';

class InformationsCard extends StatelessWidget {
  final int humidity;
  final double wind;
  final double uvIndex;

  const InformationsCard({
    Key? key,
    required this.humidity,
    required this.wind,
    required this.uvIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
