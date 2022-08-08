import 'package:flutter/material.dart';

import '../../themes/app_colors.dart';

class NotEditableTextField extends StatefulWidget {
  final String labelText;
  const NotEditableTextField({Key? key, required this.labelText}) : super(key: key);

  @override
  State<NotEditableTextField> createState() => _NotEditableTextFieldState();
}

class _NotEditableTextFieldState extends State<NotEditableTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: false,
      decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primary, width: 2),
        ),
        border: const OutlineInputBorder(),
        labelText: widget.labelText,
        floatingLabelStyle: const TextStyle(color: AppColors.primary),
        fillColor: Colors.grey,
        filled: true,
      ),
    );
  }
}
