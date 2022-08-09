import 'package:flutter/material.dart';
import 'package:morpheus/shared/themes/app_colors.dart';

class StandardButton extends StatelessWidget {
  final String Textb;
  final MaterialPageRoute route;
  const StandardButton({Key? key, required this.Textb, required this.route})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: TextButton(
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(AppColors.primary)),
        onPressed: () {
          Navigator.push(
            context,
            route,
          );
        },
        child: Text(
          Textb,
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ), //Text
      ),
    );
  }
}
