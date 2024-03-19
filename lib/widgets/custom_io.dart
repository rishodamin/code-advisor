import 'package:code_adviser_ai/api/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_code_editor/flutter_code_editor.dart';

class CustomIO extends StatefulWidget {
  final double height;
  final CodeController codeController;
  const CustomIO({
    super.key,
    required this.height,
    required this.codeController,
  });

  @override
  State<CustomIO> createState() => _CustomIOState();
}

class _CustomIOState extends State<CustomIO> {
  final ApiService _apiService = ApiService();
  final inputController = TextEditingController();
  String output = '';
  bool isLoading = false;

  @override
  void dispose() {
    super.dispose();
    inputController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: widget.height,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade700),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white10,
      ),
      child: widget.height != 350
          ? const SizedBox()
          : Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(width: 20),
                    Expanded(
                      flex: 5,
                      child: Text(
                        'Input',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(
                        'Output',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    Expanded(
                      child: MaterialButton(
                        onPressed: () async {
                          setState(() {
                            isLoading = true;
                          });
                          output = await _apiService.compile(
                            widget.codeController.text,
                            inputController.text,
                          );
                          setState(() {
                            isLoading = false;
                          });
                        },
                        color: Colors.green,
                        height: 50,
                        minWidth: 100,
                        child: const Text('Run'),
                      ),
                    ),
                    const SizedBox(
                      width: 60,
                    )
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        maxLines: 10,
                        controller: inputController,
                        decoration: const InputDecoration(
                          hintText: 'input 1\ninput 2\ninput 3\n.\n.',
                          border: null,
                          fillColor: Colors.black,
                          filled: true,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        // height: 20,
                        margin: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ).copyWith(bottom: 10),
                        height: 255,
                        color: Colors.black,
                        child: isLoading
                            ? const Center(child: CircularProgressIndicator())
                            : SingleChildScrollView(child: Text(output)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
    );
  }
}
