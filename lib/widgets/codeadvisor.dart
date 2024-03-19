import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:code_adviser_ai/provider/code_provider.dart';
import 'package:code_adviser_ai/widgets/input_border.dart';
import 'package:code_adviser_ai/widgets/review_box.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CodeAdvisorAI extends StatefulWidget {
  const CodeAdvisorAI({super.key});

  @override
  State<CodeAdvisorAI> createState() => _CodeAdvisorAIState();
}

class _CodeAdvisorAIState extends State<CodeAdvisorAI> {
  final descriptionController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 100),
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: CustomInputBorder.boxBorder,
        ),
        width: (Provider.of<CodeProvider>(context).isStart)
            ? MediaQuery.sizeOf(context).width * 0.45
            : 0,
        child: !Provider.of<CodeProvider>(context).isStart
            ? const SizedBox()
            : !Provider.of<CodeProvider>(context).isReview
                ? ListView(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                          onPressed: () {
                            Provider.of<CodeProvider>(context, listen: false)
                                .updateStartStatus(false);
                          },
                          icon: const Icon(
                            Icons.arrow_forward,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 40),
                        alignment: Alignment.center,
                        child: const Text(
                          'Code Adviser.ai 🤖',
                          style: TextStyle(
                              fontSize: 32, fontWeight: FontWeight.w300),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 40,
                        ),
                        child: AnimatedTextKit(
                          isRepeatingAnimation: false,
                          animatedTexts: [
                            TypewriterAnimatedText(
                                "Hey there! I'm your friendly AI buddy developed by Damin Technologies! I'm here to provide detailed feedback on your code, spot any potential bugs, and offer suggestions for improvement. Plus, I can make updates to the code just the way you like it. Let's make coding a breeze!",
                                speed: const Duration(milliseconds: 10),
                                textStyle: const TextStyle(fontSize: 18)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: TextField(
                          minLines: 5,
                          maxLines: 5,
                          controller: descriptionController,
                          // controller: inputController,
                          decoration: const InputDecoration(
                            hintText: 'Describe your code (optional)',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.sizeOf(context).width * 0.15),
                        child: MaterialButton(
                          onPressed: () async {
                            Provider.of<CodeProvider>(context, listen: false)
                                .updateReviewStatus(true);
                          },
                          color: Colors.green,
                          height: 60,
                          child: const Text('Review'),
                        ),
                      ),
                    ],
                  )
                : ReviewBox(
                    desc: descriptionController.text,
                  ),
      ),
    );
  }
}
