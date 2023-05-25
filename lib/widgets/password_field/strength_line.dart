import 'package:flutter/material.dart';

class StrenghtLine extends StatefulWidget {
  final int flex;

  const StrenghtLine({
    required this.flex,
    super.key
  });

  @override
  State<StrenghtLine> createState() => _StrenghtLineState();
}

class _StrenghtLineState extends State<StrenghtLine> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: widget.flex,
      child: Card(
        margin: EdgeInsets.all(0),
        color: Colors.red,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
        ),
        child: SizedBox(
          width: double.infinity,
        ),
      ),
    );
  }
}