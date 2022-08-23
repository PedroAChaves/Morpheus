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
        hint: "Descrição do evento...",
        //initalText: "text content initial, if any",
      ),
      otherOptions: const OtherOptions(
        height: 300,
      ),
    );
  }
}
