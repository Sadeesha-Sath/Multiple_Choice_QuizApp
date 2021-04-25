import 'package:flutter/material.dart';
import 'package:training_app_2/ui/ui_constants.dart';

class AnswerButton extends StatelessWidget {
  final Widget? child;
  final onPressed;
  final Color? color;
  final bool isButtonDisabled;
  final Size? size;
  final String? text;
  final TextStyle? textStyle;

  AnswerButton({
    this.size,
    this.onPressed,
    this.child,
    this.color,
    this.text,
    required this.isButtonDisabled,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(color),
          minimumSize: MaterialStateProperty.all(size ?? Size(300, 30)),
          padding: MaterialStateProperty.all(
              EdgeInsets.symmetric(vertical: 13, horizontal: 5)),
          elevation: MaterialStateProperty.all(2),
          shadowColor: MaterialStateProperty.all(Colors.white70),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ),
        onPressed: isButtonDisabled ? null : onPressed,
        child: child ??
            Text(
              text ?? "Sample",
              textAlign: TextAlign.center,
              style: textStyle ?? TextStyle(fontSize: 16, fontFamily: kAlike),
            ),
      ),
    );
  }
}
