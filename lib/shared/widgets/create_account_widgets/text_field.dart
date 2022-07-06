import 'package:flutter/material.dart';
import '../../themes/app_colors.dart';

class TextFieldWidget extends StatefulWidget {
  final String title;
  const TextFieldWidget({Key? key, required this.title}) : super(key: key);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.primary,
      decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primary, width: 2),
        ),
        border: const OutlineInputBorder(),
        labelText: widget.title,
        floatingLabelStyle: const TextStyle(color: AppColors.primary),
        fillColor: Colors.transparent,
        filled: true,
      ),
    );
  }
}
