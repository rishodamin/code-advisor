import 'package:code_adviser_ai/language/languages.dart';
import 'package:code_adviser_ai/provider/code_provider.dart';
import 'package:code_adviser_ai/widgets/custom_io.dart';
import 'package:flutter/material.dart';
import 'package:flutter_code_editor/flutter_code_editor.dart';
import 'package:flutter_highlight/themes/monokai-sublime.dart';
import 'package:provider/provider.dart';

class CustomEditor extends StatefulWidget {
  const CustomEditor({super.key});

  @override
  State<CustomEditor> createState() => _CustomEditorState();
}

class _CustomEditorState extends State<CustomEditor> {
  final controller = CodeController(
    text: EditorLanguage.initialCode['Python'], // Initial code
    language: EditorLanguage.languageMode['Python'],
  );
  List<String> languages = [
    'Python',
    'Java',
    'C',
    'C++',
    'Javascript',
    'Dart',
  ];
  String selectedLanguage = 'Python';
  bool isRun = false;

  @override
  Widget build(BuildContext context) {
    Provider.of<CodeProvider>(context, listen: false).codeController =
        controller;
    return Column(
      children: [
        const SizedBox(height: 10),
        Row(
          children: [
            const SizedBox(width: 10),
            DropdownMenu<String>(
              initialSelection: languages.first,
              onSelected: (String? value) {
                // This is called when the user selects an item.
                setState(() {
                  selectedLanguage = value!;
                  controller.clear();
                  controller.text =
                      EditorLanguage.initialCode[selectedLanguage]!;
                  controller.language =
                      EditorLanguage.languageMode[selectedLanguage];
                });
              },
              dropdownMenuEntries:
                  languages.map<DropdownMenuEntry<String>>((String value) {
                return DropdownMenuEntry<String>(value: value, label: value);
              }).toList(),
            ),
            const Expanded(child: SizedBox(width: double.infinity)),
            MaterialButton(
              onPressed: () {
                setState(() {
                  isRun = true;
                  Future.delayed(const Duration(milliseconds: 200)).then(
                    (value) => Provider.of<CodeProvider>(context, listen: false)
                        .updateStartStatus(true),
                  );
                });
              },
              color: Colors.green,
              height: 60,
              minWidth: 120,
              child: const Text('Start'),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Expanded(
          child: SingleChildScrollView(
            child: CodeTheme(
              data: CodeThemeData(styles: monokaiSublimeTheme),
              child: CodeField(
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontFamily: "Code Font",
                ),
                maxLines: 36,
                controller: controller,
              ),
            ),
          ),
        ),
        AnimatedSize(
          duration: const Duration(milliseconds: 100),
          child: Stack(
            children: [
              CustomIO(
                height: isRun ? 350 : 0,
                codeController: controller,
              ),
              if (isRun)
                Positioned(
                  right: 10,
                  top: 13,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_downward),
                    onPressed: () {
                      setState(() {
                        isRun = false;
                      });
                    },
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
