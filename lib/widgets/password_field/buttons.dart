import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oktoast/oktoast.dart';
import 'package:passlum/business_logic/password_bloc.dart';
import 'package:passlum/models/password_generator.dart';

class CopyButton extends StatelessWidget {
  const CopyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: (){
          Clipboard.setData(
          ClipboardData(
            text: PasswordGenerator().password
          )
        );
        showToast(
          "Password was successfully copied",
          position: ToastPosition.bottom,
          radius: 10.0,
        );
      }, 
      icon: Image.asset("assets/icons/Copy.png")
    );
  }
}

class RegenerateButton extends StatefulWidget {
  const RegenerateButton({Key? key}) : super(key: key);

  @override
  _RegenerateButtonState createState() => _RegenerateButtonState();
}

class _RegenerateButtonState extends State<RegenerateButton> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut, 
    );

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _animation,
      child: IconButton(
        onPressed: () {
          _controller.reset();
          _controller.forward();
          BlocProvider.of<PasswordBloc>(context).add(PasswordChangeEvent());
        },
        icon: Image.asset("assets/icons/Reload.png"),
      ),
    );
  }
}
