import 'package:flutter/material.dart';
import 'package:html_editor_enhanced/html_editor.dart';

class EnchantedTextEditor extends StatefulWidget {
  const EnchantedTextEditor({Key? key}) : super(key: key);

  @override
  State<EnchantedTextEditor> createState() => _EnchantedTextEditorState();
}

class _EnchantedTextEditorState extends State<EnchantedTextEditor> {
  HtmlEditorController controller = HtmlEditorController();
  @override
  Widget build(BuildContext context) {
    return HtmlEditor(
      controller: controller, //required
      htmlEditorOptions: const HtmlEditorOptions(
        hint: "Your text here...",
        //initalText: "text content initial, if any",
      ),
      htmlToolbarOptions: const HtmlToolbarOptions(defaultToolbarButtons: [
        //add constructors here and set buttons to false, e.g.
        ParagraphButtons(lineHeight: false, caseConverter: false)
      ]),
      otherOptions: const OtherOptions(
        height: 400,
      ),
    );
  }
}
