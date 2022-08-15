import 'package:flutter/material.dart';
import 'package:morpheus/shared/themes/app_colors.dart';

class SubjectsList extends StatefulWidget {
  const SubjectsList({Key? key}) : super(key: key);

  @override
  State<SubjectsList> createState() => _SubjectsListState();
}

class _SubjectsListState extends State<SubjectsList> {
  String dropdownValue = 'One';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      // padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      // margin: const EdgeInsets.all(30.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          width: 1, //
          color: AppColors.primary,
        ),
      ),
      child: DropdownButton<String>(
        value: dropdownValue,
        icon: const Icon(Icons.arrow_downward),
        elevation: 1,
        style: const TextStyle(color: AppColors.primary),
        onChanged: (String? newValue) {
          setState(() {
            dropdownValue = newValue!;
          });
        },
        items: <String>['One', 'Two', 'Free', 'Four']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
