import 'package:flutter/material.dart';

import '../../themes/app_colors.dart';

class EditableTextField extends StatefulWidget {
  final String labelText;
  const EditableTextField({Key? key, required this.labelText})
      : super(key: key);

  @override
  State<EditableTextField> createState() => _EditableTextFieldState();
}

class _EditableTextFieldState extends State<EditableTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primary, width: 2),
        ),
        border: const OutlineInputBorder(),
        labelText: widget.labelText,
        floatingLabelStyle: const TextStyle(color: AppColors.primary),
        fillColor: Colors.transparent,
        filled: true,
      ),
    );
  }
}
