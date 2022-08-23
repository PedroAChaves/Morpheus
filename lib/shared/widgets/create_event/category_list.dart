import 'package:flutter/material.dart';
import 'package:select_form_field/select_form_field.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  String dropdownValue = 'One';

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> _items = [
      {
        'value': '1',
        'label': 'Família',
        'textStyle': const TextStyle(color: Colors.black),
      },
      {
        'value': '2',
        'label': 'Só puto',
        'textStyle': const TextStyle(color: Colors.black),
      },
      {
        'value': '3',
        'label': 'Criança',
        'textStyle': const TextStyle(color: Colors.black),
      },
    ];
    return SelectFormField(
      type: SelectFormFieldType.dropdown, // or can be dialog
      initialValue: 'Show',
      labelText: '',
      items: _items,
      onChanged: (val) => print(val),
      onSaved: (val) => print(val),
    );
  }
}
