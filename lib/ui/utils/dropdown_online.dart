import 'package:flutter/material.dart';

class AppDropdownInput<T> extends StatelessWidget {
  final String hintText;
  final List<T> options;
  final T controller;
  final String Function(T) getLabel;
  final void Function(T?)? onChanged;

  AppDropdownInput({
    this.hintText = 'Please select an Option',
    required this.options,
    required this.getLabel,
    required this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return FormField<T>(
      builder: (FormFieldState<T> state) {
        return InputDecorator(
          decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 15, vertical: 15.0),
            labelText: hintText,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
          ),
          isEmpty: controller == null || controller == '',
          child: DropdownButtonHideUnderline(
            child: DropdownButton<T>(
              value: controller,
              isDense: true,
              onChanged: onChanged,
              items: [
                ...options.map((T value) {
                  return DropdownMenuItem<T>(
                    value: value,
                    child: Text(getLabel(value)),
                  );
                }),
              ],
            ),
          ),
        );
      },
    );
  }
}
