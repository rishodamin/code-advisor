import 'package:code_adviser_ai/widgets/codeadvisor.dart';
import 'package:code_adviser_ai/widgets/editor.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String output = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black38,
        title: const Text(
          'Damin Technologies',
          style: TextStyle(
            //  fontFamily: 'Noto Sans',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: const Row(
        children: [
          Expanded(
            child: CustomEditor(),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: CodeAdvisorAI(),
          ),
        ],
      ),

      // MaterialButton(
      //   onPressed: () async {
      //     setState(() {
      //       output = 'loading';
      //     });
      //     final resp = await _apiService.answer(_promptController.text);
      //     setState(() {
      //       _promptController.text = '';
      //       output = resp;
      //     });
      //   },
      //   child: const Text("Generate"),
      // ),
      // if (output == 'loading') const LinearProgressIndicator(),
      // if (output != 'loading' && output != '')
    );
  }
}
