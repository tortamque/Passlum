import 'package:flutter/material.dart';
import 'package:passlum/models/password_generator.dart';
import 'package:passlum/models/password_lenght.dart';
import 'package:passlum/theme/constants.dart';

class PasswordLenghtSlider extends StatefulWidget {
  final Function onSliderChanged;

  const PasswordLenghtSlider({
    required this.onSliderChanged,
    super.key
  });

  @override
  State<PasswordLenghtSlider> createState() => _PasswordLenghtSliderState();
}

class _PasswordLenghtSliderState extends State<PasswordLenghtSlider> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SliderTheme(
        data: SliderTheme.of(context).copyWith(
          showValueIndicator: ShowValueIndicator.never,
          thumbColor: CustomColors.darkBlue,
          activeTrackColor: CustomColors.lightBlue,
          trackHeight: 9,
          thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 15),
          tickMarkShape: SliderTickMarkShape.noTickMark, 
        ),
        child: Slider(
          value: PasswordLength().passwordLength.toDouble(), 
          min: 6,
          max: 20,
          divisions: 14,
          label: PasswordLength().passwordLength.round().toString(),
          onChanged: (double newValue){
            setState(() {
              PasswordLength().passwordLength = newValue.toInt();
              print(PasswordGenerator().generate(PasswordLength().passwordLength));
            });
            widget.onSliderChanged();
          },
        ),
      ),
    );
  }
}