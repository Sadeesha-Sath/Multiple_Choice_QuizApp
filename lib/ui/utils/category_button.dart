import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {
  final Widget? child;
  final onPressed;

  CategoryButton({
    this.child, this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(2),
          shadowColor: MaterialStateProperty.all(Colors.white70),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
        onPressed: onPressed ?? () {},
        child: ListTile(
          title: child ?? Text("Computers"),
        ),
      ),
    );
  }
}
