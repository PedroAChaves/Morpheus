import 'package:flutter/material.dart';
import 'package:morpheus/shared/themes/app_colors.dart';

typedef VoidCallback = void Function();

class SeeEventsButton extends StatefulWidget {
  final Icon icon;
  final Text text;
  final VoidCallback onPress;

  const SeeEventsButton({
    Key? key,
    required this.icon,
    required this.text,
    required this.onPress,
  }) : super(key: key);

  @override
  _SeeEventsButtonState createState() => _SeeEventsButtonState();
}

class _SeeEventsButtonState extends State<SeeEventsButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.8),
            spreadRadius: 2,
            blurRadius: 2,
            offset: const Offset(2, 4),
          ),
        ],
      ),
      child: TextButton(
        onPressed: widget.onPress,
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
              side: const BorderSide(color: AppColors.primary, width: 1),
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [widget.icon, widget.text],
        ),
      ),
    );
  }
}
