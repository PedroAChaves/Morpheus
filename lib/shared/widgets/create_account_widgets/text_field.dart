import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../themes/app_colors.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    Key? key,
    this.inputFormatters,
    this.validator,
  }) : super(key: key);
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: inputFormatters,
      validator: validator,
      decoration: const InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primary, width: 2),
        ),
        border: OutlineInputBorder(),
        labelText: 'Informe seu nome',
        floatingLabelStyle: TextStyle(color: AppColors.primary),
        fillColor: Colors.transparent,
        filled: true,
      ),
    );
  }
}
