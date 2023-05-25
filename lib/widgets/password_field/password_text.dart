import 'package:flutter/material.dart';

class PasswordText extends StatefulWidget {
  final String text;
  final int flex;

  const PasswordText({
    required this.text,
    required this.flex,
    super.key
  });

  @override
  State<PasswordText> createState() => _PasswordTextState();
}

class _PasswordTextState extends State<PasswordText> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: widget.flex,
      child: Text(
        widget.text,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600
        ),
      ),
    );
  }
}