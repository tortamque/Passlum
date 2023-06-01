import 'package:flutter/material.dart';

class Filler extends StatelessWidget {
  final int flex;

  const Filler({
    super.key,
    required this.flex
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Container(
      ),
    );
  }
}